# RNG Example Algorithms
Throughout history random numbers have been needed for scientific calculatios.
These are a few of the pseudorandom number generators througout history.

## Example Algorithms
### [Middle Square](https://en.wikipedia.org/wiki/Middle-square_method)
John von Neumann was a pioneer in computer-based random number generators.
He developed psuedorandom numbers through the Middle-square method.
To generate a sequence of 4-digit pseudorandom numbers, a 4-digit starting
value is created and squared, producing an 8-digit number. If the result has
fewer than 8 digits, leading zeroes are added to compensate. The middle 4
digits of the result would be the next number in the sequence, and returned
as the result. This process is then repeated to generate more numbers.

### [Linear Congruential Generator](https://en.wikipedia.org/wiki/Linear_congruential_generator)
In 1949, Derrick Henry Lehmer invented the linear congruential generator,
which was for a long time used in most pseudorandom number generators.
A linear congruential generator (LCG) is an algorithm that yields a sequence of
pseudo-randomized numbers calculated with an equation with real-numbers that
when graphed has discontinuous line segments.

### [Xorshift](https://en.wikipedia.org/wiki/Xorshift)
Xorshift random number generators are a class of pseudorandom number generators
that were discovered by George Marsaglia. Specifically, they are a subset of
linear-feedback shift registers (LFSRs) which allow a particularly efficient
implementation without using excessively sparse polynomials. They generate the
next number in their sequence by repeatedly taking the exclusive or of a number
with a bit-shifted version of itself. This makes them extremely fast on modern
computer architectures. Like all LFSRs, the parameters have to be chosen very
carefully in order to achieve a long period.

## How to Use
 * Clone repo
 * `cd rng-examples`
 * `ruby middle_square [ENTER 4 DIGIT SEED]`
 * `ruby linear_congruential_generator [M] [A] [C] [SEED]`
 * `ruby xorshift [SEED]`
