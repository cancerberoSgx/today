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
      print 'Title: '
      { cmd: "add_todo", title: STDIN.gets.strip}
    else
      { cmd: "add_todo", title: args[1] }
    end
  elsif args[0] == "help"
    { cmd: "help" }  
  elsif args[0] == "reset"
    { cmd: "reset" }
  elsif args[0] == "check"
    if args.length < 2 
      print 'Index: '
      index = STDIN.gets.strip
      # TODO: check valid integer input
      { cmd: "check_todo", index: index.to_i}
    else
      { cmd: "check_todo" , index:  args[1].to_i}
    end
  elsif args[0] == "share"
    { cmd: "share_todos" }
  else
    {}
  end
end

# def askTitle
#   puts "Hi! Welcome to the wonderful world of Ruby programming."
#   puts "Please enter your name so that we can greet you more personally:"
#   name = STDIN.gets.strip
# end
# # askTitle
