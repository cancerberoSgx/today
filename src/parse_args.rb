require_relative 'util'
require_relative 'today'

# examples: 
# today
# today help
# today add 'optimize addToCart()'
# today check 2
# today check 2,3,4
# today check all
# today share foo@bar.com
# today share foo@bar.com,a@another.com
# today calendar
def parseArgs(args)
  if args.length == 0
    { cmd: 'list_todos' }
  elsif args[0] == 'add'
    { 
      cmd: 'add_todo', 
      title: args.length < 2 ? inquire_string : args[1]
    }
  elsif args[0] == 'help'
    { cmd: 'help' }  
  elsif args[0] == 'reset'
    { cmd: 'reset' }
  elsif args[0] == 'check'
    # TODO: check valid integer input
    { 
      cmd: 'check_todo', 
      index: args.length < 2 ? inquire_integer : args[1].to_i # TODO: validate args[1] to be integer and in range
    }
  elsif args[0] == 'share'
    { cmd: 'share_todos' }
  else
    {}
  end
end
