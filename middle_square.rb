##
# John von Neumann was a pioneer in computer-based random number generators.
# He developed psuedorandom numbers through the Middle-square method.
# To generate a sequence of 4-digit pseudorandom numbers, a 4-digit starting
# value is created and squared, producing an 8-digit number. If the result has
# fewer than 8 digits, leading zeroes are added to compensate. The middle 4
# digits of the result would be the next number in the sequence, and returned
# as the result. This process is then repeated to generate more numbers.
#
def middle_square(seed)
  # Square the seed and convert to String for interpolation
  result = (seed**2).to_s
  # Pad with leading zeroes if not 8 digits
  while result.length < 8
    result = result.prepend('0')
  end
  # Grab middle 4 digits
  result[2..5].to_i
end

# Take command line argument for Seed
seed = ARGV[0].to_i
if seed.nil?
  puts "Missing Seed Argument"
  return
end
# Output Random Numbers from Seed until repeats
output_array = []
current_value = seed
while !output_array.include?(current_value)
  puts current_value
  output_array << current_value
  current_value = middle_square(current_value)
end

puts "#{seed} produced #{output_array.count} randomly generated numbers before repating"
