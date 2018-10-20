// Very basic wrapping for FastNoise
%module FastNoise

%{
#include "FastNoise.h"
%}


%rename("seed=")                         FastNoise::SetSeed;
%rename("seed")                          FastNoise::GetSeed;
%rename("frequency=")                    FastNoise::SetFrequency;
%rename("frequency")                     FastNoise::GetFrequency;
%rename("interp=")                       FastNoise::SetInterp;
%rename("interp")                        FastNoise::GetInterp;
%rename("noise_type=")                   FastNoise::SetNoiseType;
%rename("noise_type")                    FastNoise::GetNoiseType;
%rename("fractal_octaves=")              FastNoise::SetFractalOctaves;
%rename("fractal_octaves")               FastNoise::GetFractalOctaves;
%rename("fractal_lacunarity=")           FastNoise::SetFractalLacunarity;
%rename("fractal_lacunarity")            FastNoise::GetFractalLacunarity;
%rename("fractal_gain=")                 FastNoise::SetFractalGain;
%rename("fractal_gain")                  FastNoise::GetFractalGain;
%rename("fractal_type=")                 FastNoise::SetFractalType;
%rename("fractal_type")                  FastNoise::GetFractalType;
%rename("cellular_distance_function=")   FastNoise::SetCellularDistanceFunction;
%rename("cellular_distance_function")    FastNoise::GetCellularDistanceFunction;
%rename("cellular_return_type=")         FastNoise::SetCellularReturnType;
%rename("cellular_return_type")          FastNoise::GetCellularReturnType;
%rename("cellular_noise_lookup=")        FastNoise::SetCellularNoiseLookup;
%rename("cellular_noise_lookup")         FastNoise::GetCellularNoiseLookup;
%rename("cellular_distance_2indices=")   FastNoise::SetCellularDistance2Indices;
%rename("cellular_distance_2indices")    FastNoise::GetCellularDistance2Indices;
%rename("cellular_jitter=")              FastNoise::SetCellularJitter;
%rename("cellular_jitter")               FastNoise::GetCellularJitter;
%rename("gradient_perturb_amp=")         FastNoise::SetGradientPerturbAmp;
%rename("gradient_perturb_amp")          FastNoise::GetGradientPerturbAmp;
%rename("can_be_periodic?")              FastNoise::CanBePeriodic;
%rename("value")                         FastNoise::GetValue;
%rename("value_fractal")                 FastNoise::GetValueFractal;
%rename("perlin")                        FastNoise::GetPerlin;
%rename("perlin_fractal")                FastNoise::GetPerlinFractal;
%rename("simplex_fractal")               FastNoise::GetSimplexFractal;
%rename("cellular")                      FastNoise::GetCellular;
%rename("cubic")                         FastNoise::GetCubic;
%rename("cubic_fractal")                 FastNoise::GetCubicFractal;
%rename("noise")                         FastNoise::GetNoise;
%rename("periodic_noise")                FastNoise::GetPeriodicNoise;
%rename("gradient_perturb")              FastNoise::GradientPerturb;
%rename("gradient_perturb_fractal")      FastNoise::GradientPerturbFractal;
%rename("simplex")                       FastNoise::GetSimplex;
%rename("white_noise")                   FastNoise::GetWhiteNoise;
%rename("white_noise_int")               FastNoise::GetWhiteNoiseInt;


%include FastNoise.h

%extend FastNoise {
 public:
  // Returns an array of arrays for the integer values 0->w, 0->h
  VALUE segment(int w, int h) {
	VALUE height_map = rb_ary_new2(w);
	for (int x = 0; x < w; x++) {
	  VALUE row = rb_ary_new2(h);
		for (int y = 0; y < h; y++) {
		  rb_ary_store(row, y, SWIG_From_float($self->GetNoise(x,y)));
		}
	  rb_ary_store(height_map, x, row);
	}
	return height_map;
  }
  float simplex_periodic(float x, float y,
						  int period_x, int period_y) {

	float dx = x / period_x;
	float dy = y / period_y;
	
	float nx = cos(dx*2*M_PI) * (2*M_PI);
	float ny = cos(dy*2*M_PI) * (2*M_PI);
	float nz = sin(dx*2*M_PI) * (2*M_PI);
	float nw = sin(dy*2*M_PI) * (2*M_PI);

	return $self->GetSimplex(nx, ny, nz, nw);
  }

  // Returns an array with wrapping simplex values
  VALUE simplex_periodic_tile(int w, int h) {
	VALUE height_map = rb_ary_new2(w);
	float dx, dy, nx, ny, nz, nw;

	for (int x = 0; x < w; x++) {
	  VALUE row = rb_ary_new2(h);
	  dx = float(x) / w;
	  nx = cos(dx*2*M_PI) * (2*M_PI);
	  nz = sin(dx*2*M_PI) * (2*M_PI);
	  for (int y = 0; y < h; y++) {
		dy = float(y) / h;
		ny = cos(dy*2*M_PI) * (2*M_PI);
		nw = sin(dy*2*M_PI) * (2*M_PI);
		rb_ary_store(row, y, SWIG_From_float($self->GetSimplex(nx, ny, nz, nw)));
	  }
	  rb_ary_store(height_map, x, row);
	}
	return height_map;
  }
  
};
