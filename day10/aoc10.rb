def look_say input
  output = input.scan(/((\d)\2*)/).map(&:first).each_with_object "" do |sc, str|
      str << "#{sc.length}#{sc[0]}"
    end
  output
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
