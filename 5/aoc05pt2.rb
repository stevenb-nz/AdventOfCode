f = File.new("input05.txt")
nice_strings = 0
f.each do |line|
  this_string = "nice"
  this_string = "naughty" if line.scan(/(..).*\1/).count == 0
  this_string = "naughty" if line.scan(/(.).\1/).count == 0
  nice_strings += 1 if this_string == "nice"
end
puts nice_strings
