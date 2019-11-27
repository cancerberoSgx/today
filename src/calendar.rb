require "google/apis/calendar_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "date"
require "fileutils"
require_relative 'today'

OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
APPLICATION_NAME = "Today".freeze
CREDENTIALS_PATH = (File.join Today.folder, "credentials.json").freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first time.
TOKEN_PATH = (File.join Today.folder, "token.yaml").freeze
SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

class Calendar
  def initialize
    if ! File.exists? CREDENTIALS_PATH
      print "File '#{CREDENTIALS_PATH}' not found. Please 'Enable the Google Calendar API' at 'https://developers.google.com/calendar/quickstart/ruby' and copy 'credentials.json' to '#{CREDENTIALS_PATH}'\n"
    else
    end
  end
  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or intitiating an OAuth2 authorization. If authorization is required,
  # the user's default browser will be launched to approve the request.
  #
  # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
  def authorize
    client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
    token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
    authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
    user_id = "default"
    credentials = authorizer.get_credentials user_id
    if credentials.nil?
      url = authorizer.get_authorization_url base_url: OOB_URI
      puts "Open the following URL in the browser and enter the " \
          "resulting code after authorization:\n\n" + url
      print 'Code: '
      code = STDIN.gets
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: OOB_URI
      )
    end
  end
  def next_events
    # Initialize the API
    service = Google::Apis::CalendarV3::CalendarService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize
    # Fetch the next 10 events for the user
    calendar_id = "primary"
    response = service.list_events(calendar_id, max_results: 10, single_events: true, 
      order_by: "startTime", time_min: today_zero_hour.rfc3339, time_max: (today_zero_hour + 1).rfc3339)
    puts "Upcoming events:"
    puts "No upcoming events found" if response.items.empty?
    response.items.each do |event|
      start = event.start.date || event.start.date_time
      puts "- #{event.summary} (#{start})"
    end
  end
end
