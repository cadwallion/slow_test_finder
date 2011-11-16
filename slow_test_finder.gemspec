# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "slow_test_finder/version"

Gem::Specification.new do |s|
  s.name        = "slow_test_finder"
  s.version     = SlowTestFinder::VERSION
  s.authors     = ["Andrew Nordman"]
  s.email       = ["cadwallion@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "slow_test_finder"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
