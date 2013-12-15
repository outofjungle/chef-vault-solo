# chef-vault-solo
[![Build Status](https://travis-ci.org/outofjungle/chef-vault-solo.png?branch=master)](https://travis-ci.org/outofjungle/chef-vault-solo)
[![Gem Version](https://badge.fury.io/rb/chef-vault-solo.png)](http://badge.fury.io/rb/chef-vault-solo)
[![Code Climate](https://codeclimate.com/github/outofjungle/chef-vault-solo.png)](https://codeclimate.com/github/outofjungle/chef-vault-solo)
[![Dependency Status](https://gemnasium.com/outofjungle/chef-vault-solo.png)](https://gemnasium.com/outofjungle/chef-vault-solo)
[![Coverage Status](https://coveralls.io/repos/outofjungle/chef-vault-solo/badge.png?branch=master)](https://coveralls.io/r/outofjungle/chef-vault-solo?branch=master)

## Description

Monkey patches chef-vault to read from local data bag when run in solo mode.

## Usage

Install `chef-vault-solo` gem and require the `chef-vault/patch` to patch the chef-vault behavior.

    chef_gem 'chef-vault-solo'
    require 'chef-vault/patch'

    secrets = ChefVault::Item.load('data_bag', 'item')

When `Chef::Config[:solo]` is `true`, this method will read the data from `data_bags/data_bag/item.json` file.

## Example cookbook

Please visit the example [cookbook](https://github.com/outofjungle/chef-vault-solo-cookbook) for more information on usage and implementation.
