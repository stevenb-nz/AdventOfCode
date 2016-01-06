def increment input
  pos = 7
  while input[pos] == 'z'
    input[pos] = 'a'
    pos -= 1
  end
  if pos >= 0
    input[pos] = input[pos].next
    input[pos] = input[pos].next if ['i','o','l'].include? input[pos]
  end
  return input
end

def valid input
  valid = true
  valid = false if input.include? 'i'
  valid = false if input.include? 'o'
  valid = false if input.include? 'l'
  valid = false if not run_of_3 input
  valid = false if input.scan(/(.)\1.*(.)\2/).count == 0
  return valid
end

def run_of_3 input
  output = false
  input.chars.to_a.each_cons(3) { |a,b,c| output = true if a.next == b and b.next == c }
  return output
end

f = File.new("input11.txt")
input = ""
f.each_char do |c|
  input += c
end
while not valid input
  input = increment input
end
puts input
input = increment input
while not valid input
  input = increment input
end
puts input
