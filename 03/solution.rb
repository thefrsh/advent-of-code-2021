# input read
input = Array.new
length = 0

File.open('03.txt').each do |line|
  length = line.strip.length if length == 0
  input.append(line.to_i(2))
end

lines = input.length

# part 1
gamma = 0
counts = Array.new(length, 0)

input.each do |number|
  (0..length - 1).each do |shift|
    mask = 1 << shift
    result = mask & number
    if result != 0
      index = length - 1 - shift
      counts[index] += 1
      if counts[index] > (lines / 2)
        gamma = gamma | mask
      end
    end
  end
end

epsilon = gamma ^ (1 << length) - 1

# 4006064
puts gamma * epsilon

