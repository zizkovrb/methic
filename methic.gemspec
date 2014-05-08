# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'methic/version'

Gem::Specification.new do |spec|
  spec.name          = "methic"
  spec.version       = Methic::VERSION
  spec.authors       = ["Josef Šimánek"]
  spec.email         = ["josef.simanek@gmail.com"]
  spec.summary       = %q{Simple arithmetic implemented by Treetop.}
  spec.homepage      = "https://github.com/zizkovrb/methic"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "treetop"

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake"
end
