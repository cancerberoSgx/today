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
    { cmd: "add_todo" }
  elsif args[0] == "help"
    { cmd: "help" }
  elsif args[0] == "check"
    { cmd: "check_todo" }
  elsif args[0] == "share"
    { cmd: "share_todos" }
  else
    {}
  end
end

