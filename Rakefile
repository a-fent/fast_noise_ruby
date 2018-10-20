require "bundler/gem_tasks"

file "ext/FastNoise_wrap.cxx" => "ext/FastNoise.i" do
  sh "swig -c++ -ruby ext/FastNoise.i"
end

file "ext/FastNoise.so" => "ext/FastNoise_wrap.cxx" do
  cd "ext" do 
    sh "ruby extconf.rb"
    sh "make"
  end
end

file "lib/fast_noise/FastNoise.so" => "ext/FastNoise.so" do
  cp "ext/FastNoise.so", "lib/fast_noise/FastNoise.so"
end

task :swig => ["ext/FastNoise_wrap.cxx"]
task :default => ["lib/fast_noise/FastNoise.so"]
