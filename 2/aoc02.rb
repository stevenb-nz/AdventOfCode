f = File.new("input02.txt")
total = 0
ribbon_total = 0
f.each do |line|
  la = line.chomp.split('x').map(&:to_i).sort
  total += 3*la[0]*la[1]+2*la[2]*(la[0]+la[1])
  ribbon_total += 2*(la[0]+la[1])+la[0]*la[1]*la[2]
end
puts total
puts ribbon_total
