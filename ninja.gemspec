$:.push File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
require 'ninja/version'

Gem::Specification.new do |s|
  s.name              = 'ninja'
  s.version           = Ninja.version
  s.platform          = Gem::Platform::RUBY
  s.author            = 'Michael Williams'
  s.email             = 'm.t.williams@live.com'
  s.homepage          = 'https://github.com/mtwilliams/ninja'
  s.summary           = 'Generate Ninja build files.'
  s.description       = 'Ninja is a simple Ruby DSL for generating ninja build files.'
  s.license           = 'Public Domain'

  s.required_ruby_version = '>= 1.9.3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  # TODO(mtwilliams): Handle this gracefuly in `bin/ninja'.
  s.require_paths = %w(lib)

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'aruba'
end
