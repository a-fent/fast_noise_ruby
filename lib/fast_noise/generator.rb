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

  class PerlinFractal < Generator
    def initialize(args = {})
      super()
      self.noise_type = FastNoise::PerlinFractal
    end
  end
  
  class Simplex < Generator
    def initialize(args = {})
      super()
      self.noise_type = FastNoise::Simplex
    end
  end
  
  class SimplexFractal < Generator
    def initialize(args = {})
      super()
      self.noise_type = FastNoise::SimplexFractal
    end
  end
  
  class WhiteNoise < Generator
    def initialize(args = {})
      super()
      self.noise_type = FastNoise::WhiteNoise
    end
  end
end
