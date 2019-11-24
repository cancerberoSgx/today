require 'json'

def JSONParse(str)
  JSON.parse(str)
end

def JSONStringify(obj)
  JSON.generate(obj)
end