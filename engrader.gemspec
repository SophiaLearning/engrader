# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'engrader/version'

Gem::Specification.new do |spec|
  spec.name          = "engrader"
  spec.version       = Engrader::VERSION
  spec.authors       = ["Sidoruk Nikolay"]
  spec.email         = ["nnsidoruk@gmail.com"]
  spec.description   = %q{Engrade's api client}
  spec.summary       = %q{Wrapper for Engrade's api: https://engradestage.com/docs/index.html}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_runtime_dependency     "httparty", "~> 0.12.0"
end
