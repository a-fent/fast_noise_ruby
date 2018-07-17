module FastNoise
  # Alias the class
  # Should probably do this in swig
  Generator = FastNoise
  class Generator
    alias :"[]" :noise
  end
  
  class Perlin < Generator
    def initialize(args = {})
      super()
      self.noise_type = FastNoise::Perlin
    end
  end
end
