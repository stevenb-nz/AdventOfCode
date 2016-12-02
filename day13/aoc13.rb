require 'set'
f = File.new("input13.txt")
LocationPair = Struct.new(:loc1, :loc2)
distances = Hash.new
locations = Set.new []
f.each do |line|
  distance = line.split
  distances[LocationPair.new(distance[0],distance[2])] = distance[4].to_i
  distances[LocationPair.new(distance[2],distance[0])] = distance[4].to_i
  locations.add(distance[0])
  locations.add(distance[2])
end
routes = locations.to_a.permutation.to_a
shortest_distance = 0
longest_distance = 0
routes.each do |route|
  distance = 0
  route.each_cons(2) { |loc1,loc2| distance += distances[LocationPair.new(loc1,loc2)]}
  shortest_distance = distance if (distance < shortest_distance or shortest_distance == 0)
  longest_distance = distance if distance > longest_distance
end
puts shortest_distance
puts longest_distance
