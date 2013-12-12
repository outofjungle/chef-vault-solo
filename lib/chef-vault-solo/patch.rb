require 'chef-vault'

ChefVault::Item.class_eval do
  self.singleton_class.send(:alias_method, :load_vault, :load)

  def self.load(vault, name)
    if ChefVault::Item.solo?
      Chef::DataBagItem.load(vault, name)
    else
      ChefVault::Item.load_vault(vault, name)
    end
  end

  def self.solo?
    Chef::Config[:solo] == true
  end
end