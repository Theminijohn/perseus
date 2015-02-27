# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'perseus/version'

Gem::Specification.new do |spec|
  spec.name          = 'perseus'
  spec.version       = Perseus::VERSION
  spec.authors       = ['The Mini John']
  spec.email         = ['the@minijohn.me']
  spec.summary       = %q{Testing}
  spec.description   = %q{Testing}
  spec.homepage      = "http://www.leagueio.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'webmock', '>= 1.8.0', '< 1.16'

  spec.add_runtime_dependency 'httparty'
  spec.add_runtime_dependency 'activesupport'
end
