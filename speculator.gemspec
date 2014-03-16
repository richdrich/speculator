# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'speculator/version'

Gem::Specification.new do |spec|
  spec.name          = "speculator"
  spec.version       = Speculator::VERSION
  spec.authors       = ["Richard Parratt"]
  spec.email         = ["richard.parratt@gmail.com"]
  spec.summary       = %q{RSpec Generator.}
  spec.description   = %q{Generates RSpecs automatically by tracing live/fixture code execution. Because you want to.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency 'redis'
  spec.add_runtime_dependency "activesupport", "~> 3.2.17"

end
