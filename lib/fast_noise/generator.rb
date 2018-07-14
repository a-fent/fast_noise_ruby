module FastNoise
  # Alias the class
  # Should probably do this in swig
  Generator = FastNoise
  class Generator
    alias :"[]" :get_noise
  end
  
  class Perlin < Generator
    def initialize(args = {})
      super()
      set_noise_type FastNoise::Perlin
    end
  end
  
end
