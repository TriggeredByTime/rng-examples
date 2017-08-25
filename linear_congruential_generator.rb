##
# In 1949, Derrick Henry Lehmer invented the linear congruential generator,
# which was for a long time used in most pseudorandom number generators.
# A linear congruential generator (LCG) is an algorithm that yields a sequence of
# pseudo-randomized numbers calculated with an equation with real-numbers that
# when graphed has discontinuous line segments.
#
# The generator is defined by the recurrence relation:
# X_n+1 = (aX_n + c) % m
#
# m, 0 < m - The modulus
# a, 0 < a < m - The multiplier
# c, 0 <= c < m, The increment
# X_0, 0 <= X_0 < m - The seed
#
# @see https://en.wikipedia.org/wiki/Linear_congruential_generator
#
def linear_congruential_generator(value)
  (@a * value + @c) % @m
end

@m, @a, @c, seed = ARGV.map(&:to_i)

# Make sure we get all require values
if [@m, @a, @c].any?(&:nil?)
  puts "Missing require parameters"
  return
end

# Make sure values are within required ranges
if @a <= 0 || @a >= @m
  puts "'a' value is not greater than 0 or less than m"
  return
elsif @c < 0 || @c >= @m
  puts "'c' value is not greater than or equal to 0 or less than m"
  return
elsif seed < 0 || seed >= @m
  puts "'seed' value is not greater than 0 or less than m"
  return
end

# Output Random Numbers from Seed until repeats
output_array = []
current_value = seed
while !output_array.include?(current_value)
  puts current_value
  output_array << current_value
  current_value = linear_congruential_generator(current_value)
end

puts "\nProduced #{output_array.count} randomly generated numbers before repeating"
