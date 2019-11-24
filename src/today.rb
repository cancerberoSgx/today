require 'fileutils'

def today_initialize
  folder = today_folder
  FileUtils.mkdir_p folder unless File.directory?(folder)
  today = today_file
  File.open(today, 'w') { |f| f.puts('{}') } unless File.exist? today
end

# @return [String]
def today_folder
  File.join ENV['HOME'], '.today'
end

# @return [String]
def today_file
  File.join today_folder, "#{today_id}.json"
end

def today_id
  Time.now.strftime('%Y-%m-%d')
end
