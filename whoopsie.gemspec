$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "whoopsie/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "whoopsie"
  s.version     = Whoopsie::VERSION
  s.authors     = ["Wojtek Kruszewski"]
  s.email       = ["wojtek@oxos.pl"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Whoopsie."
  s.description = "TODO: Description of Whoopsie."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"
end
