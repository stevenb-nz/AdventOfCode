require 'set'
Point = Struct.new(:x, :y)
current_x = 0
current_y = 0
locations = Set.new [Point.new(current_x,current_y)]
f = File.new("input03.txt")
f.each_char do |c|
  current_x -= 1 if c == '<'
  current_x += 1 if c == '>'
  current_y -= 1 if c == '^'
  current_y += 1 if c == 'v'
  locations.add(Point.new(current_x,current_y))
end
puts locations.count
