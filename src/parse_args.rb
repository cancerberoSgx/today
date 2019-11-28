require_relative 'util'
require_relative 'today'

def parseArgs(args)
  # args, options = parse_options
  if args.length == 0
    { cmd: 'list_todos' }
  elsif args[0] == 'add'
    { 
      cmd: 'add_todo', 
      title: args.length < 2 ? inquire_string : args[1]
    }
  elsif args[0] == 'help'
    { cmd: 'help' }    
  elsif args[0] == 'calendar'
    { cmd: 'calendar' }  
  elsif args[0] == 'reset'
    { cmd: 'reset' }
  elsif args[0] == 'check'
    # TODO: check valid integer input
    # TODO: validate args[1] to be integer and in range
    {
      cmd: 'check_todo', 
      index: args.length < 2 ? inquire_integer : args[1].to_i
    }
  elsif args[0] == 'month'
    { cmd: 'month' }  
  elsif args[0] == 'year'
    { cmd: 'year' }
  elsif args[0] == 'renderer'
    { 
      cmd: 'renderer',
    id: args.length < 2 ? inquire_string : args[1]
   }  
    
  else
    {}
  end
end



# class Array
#   def splice(start, len, *replace)
#     ret = self[start, len]
#     self[start, len] = replace
#     retn
#   end
# end

# class Args

# end



# def parse_options(args)
#   i=0
#   a=args.clone
#   while i<a.length do
#     [].sort
#   end

#   options  = []
#   for i in (0..args.length) do
#     arg=args[i]
#     if arg.start_with '--'
#       [].extend.each_slice
#     end
#   end
#   # args.each_index{|i|
#   # end
#   # }
#   # args.ea
#   # for arg in enumerable do
    
#   # end
# end