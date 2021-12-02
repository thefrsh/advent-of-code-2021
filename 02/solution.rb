# input read
input = Array.new
tuple = Struct.new(:action, :delta)

File.open('02.txt').each do |line|
  action, delta = line.split
  input.append(tuple.new(action, delta.to_i))
end

def move(input, actions)
  horizontal = 0
  depth = 0
  aim = 0
  input.each do |tuple|
    horizontal, depth, aim = actions[tuple.action].call(horizontal, depth, aim, tuple.delta)
  end
  horizontal * depth
end

# part1
actions_one = Hash.new
actions_one['forward'] = -> (h, d, a, delta) { h += delta; return h, d, a }
actions_one['up'] = -> (h, d, a, delta) { d -= delta; return h, d, a }
actions_one['down'] = -> (h, d, a, delta) { d += delta; return h, d, a }

# 2187380
puts move(input, actions_one)

# part 2
actions_two = Hash.new
actions_two['forward'] = -> (h, d, a, delta) { h += delta; d += (a * delta); return h, d, a }
actions_two['up'] = -> (h, d, a, delta) { a -= delta; return h, d, a }
actions_two['down'] = -> (h, d, a, delta) { a += delta; return h, d, a }

# 2086357770
puts move(input, actions_two)
