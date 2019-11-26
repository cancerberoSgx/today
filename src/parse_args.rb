# typed: true

# examples: 
# today
# today help
# today add "optimize addToCart()"
# today check 2
# today check 2,3,4
# today check all
# today share foo@bar.com
# today share foo@bar.com,a@another.com
# today calendar
# today calendar 1
def parseArgs(args)
  if args.length == 0
    { cmd: "list_todos" }
  elsif args[0] == "add"
    if args.length < 2 
      # TODO: ask title
      { cmd: "add_todo", title: 'TODO: ask title'}
    else
      { cmd: "add_todo", title: args[1] }
    end
  elsif args[0] == "help"
    { cmd: "help" }  
  elsif args[0] == "reset"
    { cmd: "reset" }
  elsif args[0] == "check"
    if args.length < 2 
      # TODO: ask index
      { cmd: "check_todo", index: 0}
    else
      { cmd: "check_todo" , index:  args[1].to_i}
    end
  elsif args[0] == "share"
    { cmd: "share_todos" }
  else
    {}
  end
end

