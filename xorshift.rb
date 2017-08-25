##
# Xorshift random number generators are a class of pseudorandom number generators
# that were discovered by George Marsaglia. Specifically, they are a subset of
# linear-feedback shift registers (LFSRs) which allow a particularly efficient
# implementation without using excessively sparse polynomials. They generate the
# next number in their sequence by repeatedly taking the exclusive or of a number
# with a bit-shifted version of itself. This makes them extremely fast on modern
# computer architectures. Like all LFSRs, the parameters have to be chosen very
# carefully in order to achieve a long period.
#
# @see https://en.wikipedia.org/wiki/Xorshift
#
def xorshift(states)
  x = states[0]
  x ^= x << 13
  x ^= x >> 17
  x ^= x << 5
  states[0] = x
  x
end

# Take command line argument for States
states = ARGV.map(&:to_i)
if states.empty?
  puts "Missing States Argument"
  return
end
# Output Random Numbers from Seed until 5000 numbers generated
stop_count = 5000
output_array = []
current_value = xorshift(states)
while !output_array.include?(current_value) && output_array.count < stop_count
  output_array << current_value
  current_value = xorshift(states)
end

puts "Unique numbers generated before stopping: #{output_array.count}"
