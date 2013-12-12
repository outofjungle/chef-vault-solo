$:.push File.expand_path("../lib", __FILE__)
require 'chef-vault-solo/version'

Gem::Specification.new do |spec|

  spec.name = 'chef-vault-solo'
  spec.version = ChefVaultSolo::VERSION
  spec.summary = 'chef-vault-solo'
  spec.description = 'Patches chef-vault to work in both chef-solo and client mode'

  spec.authors = ['Venkat Venkataraju']
  spec.email = 'venkat.venkataraju@yahoo.com'
  spec.homepage = 'https://github.com/outofjungle/chef-vault-solo'

  spec.files = %w(README.md) + Dir.glob('lib/**/*') + Dir.glob('bin/*')
  spec.require_path = 'lib'

  spec.required_ruby_version = '>= 1.9'

  spec.add_dependency 'chef'
  spec.add_dependency 'chef-vault'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.license = 'MIT'
end