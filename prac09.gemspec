# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prac09/version'

Gem::Specification.new do |spec|
  spec.name          = "prac09"
  spec.version       = Prac09::VERSION
  spec.authors       = ["Leonor Priego","Carlos Martin"]
  spec.email         = ["alu0100699906@ull.edu.es","alu0100702293@ull.edu.es"]
  spec.description   = %q{Clases que permiten gestionar matrices densas y dispersas de manera distinta}
  spec.summary       = %q{Aplicación para trabajar con matrices densas y dispersas}
  spec.homepage      = "https://github.com/alu0100699906/pract09"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end
