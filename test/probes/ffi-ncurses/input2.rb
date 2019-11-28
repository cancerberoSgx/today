require "ffi-ncurses"

begin
  stdscr = FFI::NCurses.initscr
  FFI::NCurses.halfdelay(1)
  FFI::NCurses.noecho
  FFI::NCurses.keypad(stdscr, true)  # handle special keys

  last_read = Time.now
  prompted  = false
  loop do
    char = FFI::NCurses.getch
    if char != FFI::NCurses::ERR
      last_read = Time.now
      key       = nil
      # find key in special constants
      if (FFI::NCurses::KEY_CODE_YES..FFI::NCurses::KEY_MAX).include?(char)
        FFI::NCurses::KeyDefs.constants.each do |key_name|
          if key_name.to_s.start_with?("KEY_") &&
             FFI::NCurses::KeyDefs.const_get(key_name) == char
            key = key_name
          end
        end
      else
        key = char.chr
      end
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