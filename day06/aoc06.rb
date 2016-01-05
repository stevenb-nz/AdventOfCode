class FireHazard
  def initialize
    @mainarray = []
    1000.times do
      subarray = []
      1000.times do
        subarray << 0
      end
      @mainarray << subarray
    end
  end

  def count_lights
    count_of_lights = 0
    @mainarray.each do |sub|
      count_of_lights += sub.inject(0) {|sum,x| sum+x}
    end
    count_of_lights
  end

  def process instruction
    instructions = instruction.split /[\s,]/
    instructions = instructions.drop(1) if instructions[0] == "turn"
    execute instructions
  end

  private
  def execute i
    for x in i[1].to_i..i[4].to_i
      for y in i[2].to_i..i[5].to_i
        case i[0]
        when "on"
          @mainarray[x][y] = 1
        when "off"
          @mainarray[x][y] = 0
        when "toggle"
          @mainarray[x][y] = 1 - @mainarray[x][y]
        end
      end
    end
  end

end

fire_hazard = FireHazard.new
f = File.new("input06.txt")
f.each do |line|
  fire_hazard.process line
end
puts fire_hazard.count_lights