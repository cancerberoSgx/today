# http://graysoftinc.com/terminal-tricks/basic-curses
# 
require "ffi-ncurses"  # gem install ffi-ncurses

begin
  # setup
  stdscr = FFI::NCurses.initscr  # start curses
  FFI::NCurses.cbreak
  FFI::NCurses.noecho

  # write some content
  FFI::NCurses.waddstr(stdscr, "onez\n")
  FFI::NCurses.waddstr(stdscr, "twos\n")
  FFI::NCurses.waddstr(stdscr, "threes\n")
  FFI::NCurses.wrefresh(stdscr)

  FFI::NCurses.getch  # pause waiting on a keypress

  y, x = FFI::NCurses.getyx(stdscr)         # find the cursor
  FFI::NCurses.wmove(stdscr, y - 3, x + 3)  # make a relative move
  FFI::NCurses.waddstr(stdscr, "s")         # fix the content
  FFI::NCurses.wmove(stdscr, y, x)          # go back to where we were
  FFI::NCurses.wrefresh(stdscr)             # update what the user is seeing

  FFI::NCurses.getch  # pause waiting on a keypress
ensure
  FFI::NCurses.endwin  # end curses
end