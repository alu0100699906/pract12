require "bundler/gem_tasks"
require 'rspec/core/rake_task'


RSpec::Core::RakeTask.new
task :default => :spec

desc "Ejecutamos las pruebas unitarias"
task :test do
  sh "ruby -Ilib test/tc_matrices.rb"
end

desc "Ejecutamos la consola interactva"
task :consola do
  sh "ruby Consola.rb"
end
