$:.unshift File.expand_path('../../lib', __FILE__)

require 'coveralls'
Coveralls.wear!

require 'chef-vault'
require 'chef-vault/patch'
