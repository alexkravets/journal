# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'journal/version'

Gem::Specification.new do |s|
  s.name        = 'journal'
  s.version     = Journal::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Alexander Kravets']
  s.email       = 'alex@slatestudio.com'
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/alexkravets/journal'
  s.summary     = 'Glutten-free foundation for editorial websites powered by Character project.'
  # s.description = <<-DESC
  # DESC

  s.rubyforge_project = 'journal'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency("chr",             ">= 0.4.0")
  s.add_dependency("ants",            ">= 0.2.0")
  s.add_dependency("mongosteen",      ">= 0.1.8")
  s.add_dependency("mongoid-autoinc", ">= 4.0.0")

  s.add_development_dependency "bundler", "~> 1.9"
  s.add_development_dependency "rake",    "~> 10.0"
end
