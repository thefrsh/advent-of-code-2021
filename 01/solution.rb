# input read
input = Array.new

File.open('01.txt').each do |line|
  input.append(line.to_i)
end

# part 1
def compare(a, b)
  b > a
end

increases = 0

(1..input.length - 1).each do |index|
  if compare(input[index - 1], input[index])
    increases += 1
  end
end

# 1215
puts increases
