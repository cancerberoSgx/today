require "ffi-ncurses"

begin
  stdscr = FFI::NCurses.initscr
  FFI::NCurses.halfdelay(1)  # set a read delay of one tenth of a second
  FFI::NCurses.noecho

  last_read = Time.now
  prompted  = false
  loop do
    char = FFI::NCurses.getch     # this will wait for the read delay
    if char != FFI::NCurses::ERR  # ERR is returned when we hit the delay
      last_read = Time.now
      key       = char.chr
      FFI::NCurses.waddstr(stdscr, "You typed:  #{key.inspect}\n")
      FFI::NCurses.wrefresh(stdscr)
      break if key == ?q
    elsif !prompted && Time.now - last_read > 3
      FFI::NCurses.waddstr(stdscr, "Please type a character.\n")
      FFI::NCurses.wrefresh(stdscr)
      prompted = true
    end
  end
ensure
  FFI::NCurses.endwin
end