# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'testedviking/version'

Gem::Specification.new do |spec|
  spec.name          = "testedviking"
  spec.version       = Testedviking::VERSION
  spec.authors       = ["Dexter Ford"]
  spec.email         = ["dexter.ford.77@gmail.com"]

  spec.summary       = %q{This is a useless gem we make for class. Go home, nothing to see here.}
  spec.homepage      = "https://github.com/dexterford77/assignment_rspec_viking"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "guard-rspec", "~> 4.7.3"
end
