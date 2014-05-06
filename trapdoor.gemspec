Gem::Specification.new do |spec|
  spec.name        = 'trapdoor'
  spec.version     = '0.0.1'
  spec.date        = '2014-05-05'
  spec.summary     = "Trapdoor MUD (Multi User Dungeon)"
  spec.description = "A simple MUD server to show my son how it is done"
  spec.authorss     = ['Sean Smith', 'Kyle Smith']
  spec.email       = 'kyle.smithy2@gmail.com'
  spec.files       += Dir.glob('lib/trapdoor/**/*')
  spec.homepage    = 'http://rubygems.org/gems/trapdoor'
  spec.license       = 'MIT'
  spec.add_runtime_dependency 'sqlite3', '=1.3.9'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.require_paths = ["lib"]
end
