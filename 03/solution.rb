# input read
input = Array.new
length = 0

File.open('03.txt').each do |line|
  length = line.strip.length if length == 0
  input.append(line.to_i(2))
end

# part 1
def find_gamma(input, length)
  gamma = 0
  counts = Array.new(length, 0)
  input.each do |number|
    (0..length - 1).each do |shift|
      mask = 1 << shift
      result = mask & number
      if result != 0
        index = length - 1 - shift
        counts[index] += 1
        if counts[index] > (input.length / 2)
          gamma = gamma | mask
        end
      end
    end
  end
  gamma
end

gamma = find_gamma(input, length)
epsilon = gamma ^ (1 << length) - 1

# 4006064
puts gamma * epsilon

# part 2
def find_results(input, position, length, common)
  zeros = Array.new
  ones = Array.new
  index = length - position - 1
  input.each do |number|
    mask = 1 << index
    result = mask & number
    if result != 0
      ones.append(number)
    else
      zeros.append(number)
    end
  end
  if (ones.length >= zeros.length) == common
    results = ones
  else
    results = zeros
  end
  if results.length != 1
    position += 1
    return find_results(results, position, length, common)
  end
  results[0]
end

o2 = find_results(input, 0, length, true)
co2 = find_results(input, 0, length, false)

# 5941884
puts o2 * co2
