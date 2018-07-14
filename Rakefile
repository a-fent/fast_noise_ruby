

file "ext/FastNoise_wrap.cxx" => "ext/FastNoise.i" do
  sh "swig -c++ -ruby -autorename ext/FastNoise.i"
end

file "ext/FastNoise.so" => "ext/FastNoise_wrap.cxx" do
  sh "ruby ext/extconf.rb"
  cd "ext"
  sh "make"
end

# Rake::ExtensionTask.new("FastNoise") do | ext |
#   ext.ext_dir = 'ext'
# end
task :default => ["ext/FastNoise.so"]


