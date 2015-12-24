# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "journal/version"

Gem::Specification.new do |s|
  s.name     = "journal-chr"
  s.version  = Journal::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors  = ["Alexander Kravets"]
  s.email    = "alex@slatestudio.com"
  s.summary  = "Glutten-free foundation for editorial Character based websites."
  s.homepage = "https://github.com/alexkravets/journal"
  s.license  = "MIT"

  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.9"
  s.add_development_dependency "rake", "~> 10.0"

  s.add_dependency "chr", ">= 0.5.7"
  s.add_dependency "ants", ">= 0.3.13"
  s.add_dependency "loft", ">= 0.4.0"
  s.add_dependency "mongosteen", ">= 0.2.0"
end
