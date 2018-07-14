Fast Noise for Ruby
===================

This C++ extension for Ruby provides a fast way of producing several
types of noise, that is, quasi-random distributions over one, two or
more dimensions. Such distributions may be useful for procedural
generation, for textures in graphics, or anywhere where a reproducible
random value for one or more coordinates is needed.

It includes the relatively well-known Perlin Noise, its successor,
Simplex Noise, as well as a number of other approaches (Value, Cellular
and White Noise, Disturbance).

Example
-------

To generate one piece of noise.


`
# Create a new noise generator
fn = FastNoise::FastNoise.new
# Specify what kind of 
fn.set_noise_type(FastNoise::FastNoise::Perlin)
# Access a single noise value
fn.get_noise(4,4)
`

More information on the various kinds of generator that are available,
and the various parameters available for each can be found on the pages
of the <underlying C++ library, FastNoise
https://github.com/Auburns/FastNoise>, and <its wiki https://github.com/Auburns/FastNoise/wiki>.

I will likely make some small improvements to the Ruby interface to make
it slightly more attractive to use.

Implementation
--------------

I take no credit for the actual implementation of the various generation
procedures in C++; the code for these is directly adopted from the
<FastNoise C++ library https://github.com/Auburns/FastNoise> plus
patches from <one of its forks https://github.com/realisim/FastNoise> to
add periodicity.

The wrapper around it is a very basic SWIG wrapper (version 3.0.8).

Other Ruby Noise Modules
------------------------

There is an existing Ruby C++ module which provides classic Perlin and
Simplex noise in 2 and 3 dimensions here:
https://github.com/Spooner/ruby-perlin 

The name of this module notwithstanding, it makes no claims to be fast
in comparison to the existing implementation. If anything, it is
slightly slower, but both are extremely fast, and can produce hundreds
of thousands of points in under a second. This module, however, offers a
wider range of noise types, and, most important for me, periodic noise
(noise that can be tiled).

There is also an existing pure-Ruby implementation of Perlin,
`ruby_perlin`, here: https://github.com/junegunn/perlin_noise
Unsurprisingly for a set of functions that require a lot of mathematical
operations, the pure ruby implementation is several orders of magnitude
slower.
