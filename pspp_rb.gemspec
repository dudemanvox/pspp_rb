# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pspp_rb/version'

Gem::Specification.new do |spec|
  spec.name          ='pspp_rb'
  spec.version       = PsppRb::VERSION
  spec.authors       = ['Oleg Antonyan']
  spec.email         = %w(oleg.b.antonyan@gmail.com)

  spec.summary       = 'Wrapper for GNU PSPP statistical analysis software'
  spec.description   = 'Wrapper for GNU PSPP statistical analysis software'
  spec.homepage      =  'https://github.com/umongousProjects/pspp_rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'posix-spawn' if RUBY_VERSION < '2.2'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.44.1'
  spec.add_development_dependency 'pry', '~> 0.10.4'
end
