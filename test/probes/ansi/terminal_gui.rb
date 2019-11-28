class Widget<Region
  attr_accessor :id, :style
  def initialize
    super.initialize
    @style = default_style
    @id = unique 'widget'
  end
end

def default_style
  {}
end
class Area
  attr_accessor :width, :height
  def initialize (width=0, height=0)
    super.initialize
    @width  =width
    @height=height
  end
end
class Region<Area
  attr_accessor :x, :y # padding, border
  def initialize (x=0, y=0, width=0, height=0)
    super.initialize (width, height)
    @x  =x
    @y=y
  end
end

class RegionRenderer
def render region
end
end

class Pixel
  attr_accessor :ch, :style
end
class Screen<Area
  attr_accessor :buffer
  def initialize (width=120, height=80)
    super.initialize (0, 0, width, height)
    @buffer=[@height.times{@width.times {Pixel.new}}]
  end
  def pixel(x, y, p)
    @buffer[y][x] = p
    paint
  end

def initialize(width, height)
end
end

# module Point
#   attr_accessor :x, :y
#   def initialize (x=0, y=0)
#     @x=width
#     @y=height
#   end
#   # class Point
#   #   include Point
#   # end
# end

# module Area
#   attr_accessor :width, :height
#   def initialize (width=0, height=0)
#     @width  =width
#     @height=height
#   end
#   # class Area
#   #   include Area
#   # end
# end

# module Rectangle
#   class Rectangle
#     include Point
#     include Area
#   end
# end

# @unique = 0
# def unique (s='_')
#   "#{s}#{@unique++}"
# end



r=Rectangle::Rectangle.new
puts r.x
puts r.height