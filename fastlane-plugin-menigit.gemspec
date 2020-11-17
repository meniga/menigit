# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/menigit/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-menigit'
  spec.version       = Fastlane::Menigit::VERSION
  spec.author        = 'Meniga'
  spec.email         = 'mobile.dev@meniga.com'

  spec.summary       = 'Missing git actions'
  spec.homepage      = "https://github.com/meniga/menigit"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency('pry')
  spec.add_development_dependency('bundler')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rubocop', '1.3.1')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
  spec.add_development_dependency('fastlane', '>= 2.142.0')
  spec.add_development_dependency('codecov')
end
