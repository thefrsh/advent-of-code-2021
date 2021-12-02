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
  case action
  when 'forward'
    horizontal += delta.to_i
  when 'up'
    depth -= delta.to_i
  else
    depth += delta.to_i
  end
end

puts horizontal * depth
