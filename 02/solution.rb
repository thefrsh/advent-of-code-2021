# input read
input = Array.new

File.open('02.txt').each do |line|
  input.append(line)
end

# part1
horizontal = 0
depth = 0

input.each do |line|
  action, delta = line.split
  delta_i = delta.to_i
  case action
  when 'forward'
    horizontal += delta_i
  when 'up'
    depth -= delta_i
  else
    depth += delta_i
  end
end

# 2187380
puts horizontal * depth

# part 2
horizontal = 0
depth = 0
aim = 0

input.each do |line|
  action, delta = line.split
  delta_i = delta.to_i
  case action
  when 'forward'
    horizontal += delta_i
    depth += (aim * delta_i)
  when 'up'
    aim -= delta_i
  else
    aim += delta_i
  end
end

# 2086357770
puts horizontal * depth
