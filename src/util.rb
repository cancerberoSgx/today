require 'json'
require "date"

def JSONParse(str)
  JSON.parse(str)
end

def JSONStringify(obj)
  JSON.generate(obj)
end

# TODO: hack because \n chars are not printed with puts or print:
def print_string(s)
  s.split('\n').map {|s| puts s || ''}
end

def parse_integer(s, default=nil)
  begin
    Integer(s)
  rescue
    default
  end
end

def inquire_integer(title='Index: ', wrong='Number expected', min=nil, max=nil)
  print title
  while (i = parse_integer STDIN.gets.strip) == nil
    print "#{wrong}. #{title}"
  end
  i
end

def inquire_string(title='Title: ')
  print title
  STDIN.gets.strip
end

def today_zero_hour
  now = DateTime.now
  Date.new(now.year, now.month, now.mday)
end