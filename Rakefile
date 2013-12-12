lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rubygems/package_task'
require 'chef-vault-solo/version'

GEM_NAME = 'chef-vault-solo'
GEM_VERSION = ChefVaultSolo::VERSION

task :clean => :clobber_package

spec = eval(File.read('chef-vault-solo.gemspec'))
Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc 'install gem'
task :install => :package do
  sh %{gem install pkg/#{GEM_NAME}-#{GEM_VERSION}.gem --no-rdoc --no-ri}
end

desc 'uninstall gem'
task :uninstall do
  sh %{gem uninstall #{GEM_NAME} -x -v #{GEM_VERSION} }
end

begin
  require 'rspec/core/rake_task'

  task :default => :spec

  desc 'Run all specs in spec directory'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/unit/**/*_spec.rb'
  end

rescue LoadError
  STDERR.puts "\n*** RSpec not available. (sudo) gem install rspec to run unit tests. ***\n\n"
end