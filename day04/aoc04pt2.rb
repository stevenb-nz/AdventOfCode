require 'digest/md5'
f = File.read("input04.txt")
decimal = 0
begin
  decimal += 1
  digest = Digest::MD5.hexdigest(f+decimal.to_s)
end until digest[0..5] == '000000'
puts decimal
