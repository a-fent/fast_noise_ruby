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


``` ruby
require 'fast_noise'
# Create a new noise generator with pre-set type
fn = FastNoise::Perlin.new
# Access a single noise value (2d)
fn.noise(4,3)
# alternative syntax
fn[4, 3]

# Generic generator
fn = FastNoise::Generator.new
# Give the generator a reproducible integer seed
fn.seed = 49
# Get a specific noise type
fn.white_noise(2, 7)
```

More information on the various kinds of generator that are available,
and the various parameters available for each can be found on the pages
of the [underlying C++ library, FastNoise](https://github.com/Auburns/FastNoise), and [its wiki](https://github.com/Auburns/FastNoise/wiki).

I will likely make some further small improvements to the Ruby interface
to make the features more clearly accessible.

Implementation
--------------

I take no credit for the actual implementation of the various generation
procedures in C++; the code for these is directly adopted from the
<FastNoise C++ library https://github.com/Auburns/FastNoise> plus
patches from <one of its forks https://github.com/realisim/FastNoise> to
add periodicity.

The wrapper around it is a basic SWIG wrapper (generated with version
3.0.8). SWIG may be used to regenerate the wrapper if wanted.

Other Ruby Noise Modules
------------------------

There is an [existing Ruby C++ module which provides classic Perlin and
Simplex noise](https://github.com/Spooner/ruby-perlin) in 2 and 3
dimensions, installed with "`gem install perlin`".

Compared to this other implementation, the module here makes no claim to
be faster, its name notwithstanding. If anything, it is slightly slower,
but both are extremely fast, and can produce hundreds of thousands of
points in under a second. This module, however, offers a wider range of
noise types, and, most important for me, periodic noise (noise that can
be tiled).

There is also an [existing pure-Ruby implementation of
Perlin](https://github.com/junegunn/perlin_noise), `ruby_perlin`.
Unsurprisingly for a set of functions that require a lot of mathematical
operations, the pure ruby implementation is several orders of magnitude
slower.
