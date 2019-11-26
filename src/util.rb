# typed: true
require 'json'

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


# def inquire_integer(title='Index: ', wrong='Number expected', min=nil, max=nil)
#   print title
#   while (i = parse_integer STDIN.gets.strip) == nil && (min==nil||i==nil||i>=min) && (max==nil||i==nil||i<=max)
#     if min!=nil && i!=nil && i<min
#       print "Must be greater than #{min-1}. #{title}"
#     elsif max!=nil&&i!=nil&&i>max
#       print "Must be lower than #{max+1}. #{title}"
#     else
#       print "#{wrong}. #{title}"
#     end
#   end
#   i
# end

# def inquire_index
#   today = Today.new
#   inquire_integer 'Index: ', 'Integer expected', 0, today.todos.todos.length-1
# end
