# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_record_ignore_uniqueness_violations/version"

Gem::Specification.new do |spec|
  spec.name          = "active_record_ignore_uniqueness_violations"
  spec.version       = ActiverecordIgnoreUniquenessViolations::VERSION
  spec.authors       = ["James Brauman"]
  spec.email         = ["james.brauman@flippa.com"]

  spec.summary       = %q{Ignore uniqueness violations when creating records}
  spec.description   = %q{Ignore uniqueness violations when creating records on has and belongs to many relationships.}
  spec.homepage      = "https://github.com/jamesbrauman/active_record_ignore_uniqueness_violations"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord', '>= 3.2'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
