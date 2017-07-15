# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orm_adapter/her/version'

Gem::Specification.new do |spec|
  spec.name          = 'orm_adapter-her'
  spec.version       = OrmAdapter::Her::VERSION
  spec.authors       = ['Aleksey Zolotov']
  spec.email         = ['myxrome@gmail.com']

  spec.summary       = 'Adds Her ORM adapter to the orm_adapter project.'
  spec.description   = 'Adds Her adapter to orm_adapter which provides a single point of entry for using basic features of popular ruby ORMs.'
  spec.homepage      = 'https://github.com/myxrome/orm_adapter-her'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'activemodel', ['>= 3.0.0', '<= 6.0.0']
  spec.add_dependency 'orm_adapter', '>= 0.5.0'
  spec.add_dependency 'her', '>= 0.8.6'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
