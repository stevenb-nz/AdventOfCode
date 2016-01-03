require 'set'
Point = Struct.new(:x, :y)
current_x = 0
current_y = 0
current_robo_x = 0
current_robo_y = 0
locations = Set.new [Point.new(current_x,current_y)]
robo_locations = Set.new [Point.new(current_robo_x,current_robo_y)]
mode = 0
f = File.new("input03.txt")
f.each_char do |c|
  if mode == 0
    current_x -= 1 if c == '<'
    current_x += 1 if c == '>'
    current_y -= 1 if c == '^'
    current_y += 1 if c == 'v'
    locations.add(Point.new(current_x,current_y))
  else
    current_robo_x -= 1 if c == '<'
    current_robo_x += 1 if c == '>'
    current_robo_y -= 1 if c == '^'
    current_robo_y += 1 if c == 'v'
    locations.add(Point.new(current_robo_x,current_robo_y))
  end
  mode = 1 - mode
end
locations.merge robo_locations
puts locations.count
