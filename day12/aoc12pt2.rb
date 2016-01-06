require 'json'

def evaluate obj,total
  case obj.class.to_s
  when "Hash"
    if not obj.has_value?("red")
      obj.each do |k,v|
        total = evaluate(k,total)
        total = evaluate(v,total)
      end
    end
  when "Array"
    obj.each { |e| total = evaluate(e,total) }
  when "Fixnum"
    total += obj
  end
  return total
end

data = File.read("input12.txt")
data_hash = JSON.parse(data)
puts evaluate(data_hash,0)
