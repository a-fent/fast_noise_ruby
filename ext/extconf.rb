require 'mkmf'
have_library('stdc++')
$CXXFLAGS += " -std=c++11"
create_makefile('FastNoise')
