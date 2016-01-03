f = File.new("input01.txt")
dest_floor = 0
pos = 0
first_basement = 0
f.each_char do |c|
  dest_floor += 1 if c == '('
  dest_floor -= 1 if c == ')'
  pos += 1
  if first_basement == 0
    first_basement = pos if dest_floor == -1
  end
end
puts dest_floor
puts first_basement
