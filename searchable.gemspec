# -*- encoding: utf-8 -*-
require File.expand_path('../lib/searchable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Stefan Huska"]
  gem.email         = ["stefan.huska@gmail.com"]
  gem.description   = %q{Simple search by LIKE queries}
  gem.summary       = %q{Simple search by LIKE queries}
  gem.homepage      = "http://www.stefanhuska.sk"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "searchable"
  gem.require_paths = ["lib"]
  gem.version       = Searchable::VERSION
end
