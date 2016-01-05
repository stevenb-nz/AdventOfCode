class Circuit
  def initialize
    f = File.new("input07.txt")
    @gates = Hash.new
    f.each do |line|
      line_items = line.split(' -> ')
      @gates[line_items[1].chomp] = line_items[0]
    end
  end

  def evaluate output
    input = @gates[output]
    if input
      expression = input.split
      case expression.count
      when 1
        result = evaluate expression[0]
      when 2
        result = (~(evaluate expression[1]).to_i).to_s
      else
        result = eval2 expression
      end
      @gates[output] = result
    else
      output
    end
  end

  def eval2 exp2
    case exp2[1]
    when 'AND'
      ((evaluate exp2[0]).to_i&(evaluate exp2[2]).to_i).to_s
    when 'OR'
      ((evaluate exp2[0]).to_i|(evaluate exp2[2]).to_i).to_s
    when 'LSHIFT'
      ((evaluate exp2[0]).to_i<<exp2[2].to_i).to_s
    when 'RSHIFT'
      ((evaluate exp2[0]).to_i>>exp2[2].to_i).to_s
    end
  end

end

circuit = Circuit.new
puts circuit.evaluate 'a'
