# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rumour-ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "rumour-ruby"
  spec.version       = Rumour::VERSION
  spec.authors       = ["Joao Diogo Costa"]
  spec.email         = ["joaodiogocosta@redlightsoft.com"]
  spec.summary       = %q{Ruby wrapper for the Rumour REST API}
  spec.description   = %q{Use rumour-ruby to communicate with Rumour REST API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~> 0.13.3'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
