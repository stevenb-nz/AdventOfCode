def look_say input
  output = input.scan(/((.)\2*)/).map{|x| x[0]}.each_with_object "" do |sc, str|
      str << "#{sc.length}#{sc[0]}"
    end
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
