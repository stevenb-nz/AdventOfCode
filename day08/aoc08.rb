f = File.new("input08.txt")
char_total = 0
mem_total = 0
coded_total = 0
f.each do |line|
  char_total += line.chomp.size
  mem_total += eval(line).size
  coded_total += line.chomp.dump.size
end
puts char_total - mem_total
puts coded_total - char_total
