
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fast_noise/version"

Gem::Specification.new do |spec|
  spec.name          = "fast_noise"
  spec.version       = FastNoise::VERSION
  spec.authors       = ["Alex Fenton"]
  spec.email         = ["alex@pressure.to"]

  spec.summary       = %q{Fast noise generator for Ruby.}
  spec.description   = %q{Perlin, White Noise, Simplex etc.}
  spec.homepage      = "https://github.com/a-fent/fast_noise_ruby"
  # spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  
  spec.files << 'lib/fast_noise/FastNoise.so'
  
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
