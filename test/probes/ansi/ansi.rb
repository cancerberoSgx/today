# http://graysoftinc.com/terminal-tricks/random-access-terminal

CSI = "\e["

$stdout.puts "onez"
$stdout.puts "twos"
$stdout.puts "threes"

$stdout.write "#{CSI}3A"  # move up three lines
$stdout.write "#{CSI}3C"  # move right three characters

$stdout.write "s"         # overwrite the 'z'

$stdout.write "#{CSI}3B"  # move down three lines (after our output)
$stdout.write "#{CSI}4D"  # move back four characters (to the start of the line)

# $stdout.write "#{CSI}" 
# $stdout.write "asdasd" 

# sleep 1
# $stdout.write "#{CSI}2;2H" 
# sleep 1
# $stdout.write "#{CSI}1;2H" 
# sleep 1
# $stdout.write "#{CSI}2;1H" 
# sleep 1

class R
  def point(x,y,ch)
    "#{move x, y}#{ch}"
  end
  def move(x, y)
    "#{CSI}#{y};#{x}H"    
  end
  def rect(x, y, w, h, ch)
    s='X'
    h.times { |y_|
      s+=move(x,y + y_)
      # w.times { |x|
      #   s+=ch
      # }
      s+=(ch*w)
    }
    s+'X'
  end 
end

# puts 'l'*5

r=R.new
$stdout.write r.rect(20,10,10,20, 'l')
# while true do
#   $stdout.write r.point(rand(100), rand(30), ' ')
#   $stdout.write r.point(rand(100), rand(30), 'X')
#   $stdout.write r.point(rand(100), rand(30), ' ')
#   $stdout.write r.point(rand(100), rand(30), 'x')
#   $stdout.write r.point(rand(100), rand(30), ' ')
#   $stdout.write r.point(rand(100), rand(30), '*')
#   $stdout.write r.point(rand(100), rand(30), ' ')
#   # sleep 0.0001
# end