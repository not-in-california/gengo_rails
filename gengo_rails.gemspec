$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gengo_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gengo_rails"
  s.version     = GengoRails::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of GengoRails."
  s.description = "TODO: Description of GengoRails."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.21"
  s.add_dependency "gengo"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
end
