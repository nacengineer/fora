# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fora/version'

Gem::Specification.new do |spec|
  spec.name          = "fora"
  spec.version       = Fora::VERSION
  spec.authors       = ["David Southard"]
  spec.email         = ["nacengineer@gmail.com"]

  spec.summary       = %q{Add some time manipulation to your ruby}
  spec.description   = %q{Simple classes to work wxith dates and times}
  spec.homepage      = "https://github.com/nacengineer/fora"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.4'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",      "~> 2.1.4",  ">= 2.1"
  spec.add_development_dependency "rake",         "~> 13.0",   ">= 13.0.1"
  spec.add_development_dependency "rspec",        "~> 3.9.0",  ">= 3.9.0"

  spec.add_dependency "contracts", "~> 0.16.0", ">= 0.12.0"
end
