require_relative 'renderer_default'
require_relative 'renderer_cool'

# creates a new renderer instance of given id or the default one if id is not recognized
def renderer_named(id)
  id == 'cool' ? CoolRenderer.new : DefaultRenderer.new 
end
 