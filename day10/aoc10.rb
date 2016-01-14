def look_say input
  groups = input.scan(/((.)\2*)/).map{|x| x[0]}
  output = ""
  groups.each { |g| output << "#{g.length}#{g[0]}" }
  return output
end

f = File.new("input10.txt")
input = ""
f.each_char do |c|
  input += c
end
40.times { input = look_say(input) }
puts input.length
10.times { input = look_say(input) }
puts input.length
