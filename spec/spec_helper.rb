$:.unshift File.expand_path('../../lib', __FILE__)

require 'chef-vault'
require 'chef-vault/patch'
require 'coveralls'

Coveralls.wear!
