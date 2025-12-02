require 'mini_magick' 
# You will need http://www.graphicsmagick.org/ to mini_magick to work
require 'json'

file = File.read('positions.json')
positions = JSON.parse(file)

result = MiniMagick::Image.open("map.jpg") # 1024x1024 map
point = MiniMagick::Image.open("icon.png") # 32x32 icon

# Center of the world
base_x = 470
base_y = 691

def to_s_plus(number)
  if number > 0
    return '+' + number.round.to_s
  else
    return number.round.to_s
  end
end

positions.keys.each do |key|
  position = positions[key]

  mx = position['x'] * (82.0 / 1000.0) - 16 + base_x
  my = - position['y'] * (82.0 / 1000.0) - 32 + base_y

  mxs = to_s_plus(mx)
  mys = to_s_plus(my)

  puts "Point #{key} at #{mxs}, #{mys}"

  result = result.composite(point) do |c|
    c.compose 'Over'
    c.geometry mxs + mys
  end
end

result.write "output.jpg"