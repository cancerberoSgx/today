require "ffi-ncurses"

def color_pairs
  @color_pairs ||= { }
end

def color_pair(foreground, background)
  foreground = foreground.to_s.sub(/\Abright_/, "").to_sym
  color      = [foreground, background]

  # add the color pair if this is the first time we've seen it
  unless color_pairs.include?(color)
    foreground_color   = FFI::NCurses::Color.const_get(foreground.upcase)
    background_color   = FFI::NCurses::Color.const_get(background.upcase)
    number             = color_pairs.size + 1
    color_pairs[color] = number
    FFI::NCurses.init_pair(number, foreground_color, background_color)
  end

  # lookup the color pair
  color_pairs[color]
end

def color(window, foreground, background)
  weight = foreground.to_s.start_with?("bright") ? FFI::NCurses::A_BOLD
                                                 : FFI::NCurses::A_NORMAL
  pair   = color_pair(foreground, background)
  FFI::NCurses.wattr_set(window, weight, pair, nil)  # change colors
  yield
ensure
  # change back to default colors
  FFI::NCurses.wattr_set(window, FFI::NCurses::A_NORMAL, 0, nil)
end

begin
  stdscr = FFI::NCurses.initscr
  FFI::NCurses.cbreak
  FFI::NCurses.noecho
  FFI::NCurses.start_color                    # turn colors on
  FFI::NCurses.assume_default_colors(-1, -1)  # make color pair 0 the defaults

  [ ["C", :red],
    ["O", :bright_red],
    ["L", :bright_yellow],
    ["O", :bright_green],
    ["R", :bright_blue],
    ["S", :blue],
    ["!", :bright_magenta] ].each do |char, color|
    color(stdscr, color, :white) do
      FFI::NCurses.waddstr(stdscr, char)
    end
  end
  FFI::NCurses.waddstr(stdscr, "\n")
  FFI::NCurses.wrefresh(stdscr)

  FFI::NCurses.getch
ensure
  FFI::NCurses.endwin
end