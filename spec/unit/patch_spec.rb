require File.expand_path('../../spec_helper', __FILE__)

describe ChefVault::Item do
  let(:secrets) do
    {
      'star_wars' => "Vader is Luke's dad",
      'fight_club' => "Tyler Durden isn't real",
      'soylent_green' => "Soylent Green is people!"
    }
  end

  context 'when Chef::Config[:solo] = true' do
    before :each do
      ChefVault::Item.stub(:solo?).and_return(true)
      Chef::DataBagItem.stub(:load).with('vagrant', 'secrets').and_return(secrets)
    end

    it 'ChefVault reads from local data_bag' do
      Chef::DataBagItem.should_receive(:load).with('vagrant', 'secrets').exactly(1).times
      items = ChefVault::Item.load('vagrant', 'secrets')
      expect(items).to equal(secrets)
    end
  end

  context 'when Chef::Config[:solo] = false' do
    before :each do
      ChefVault::Item.stub(:solo?).and_return(false)
      ChefVault::Item.stub(:load_vault).with('vagrant', 'secrets').and_return(secrets)
    end

    it 'ChefVault reads from local data_bag' do
      ChefVault::Item.should_receive(:load_vault).with('vagrant', 'secrets').exactly(1).times
      items = ChefVault::Item.load('vagrant', 'secrets')
      expect(items).to equal(secrets)
    end
  end


  context 'when Chef::Config[:solo] = false' do
    before :each do
      ChefVault::Item.stub(:solo?).and_return(false)
      @chef_vault_item = double(ChefVault::Item)
      @encrypted_data_bag_item = double(Chef::EncryptedDataBagItem)
    end

    it 'the control should flow to original ChefVault::Item.load() method' do
      ChefVault::Item.should_receive(:new)
        .exactly(1).times
        .and_return(@chef_vault_item)

      Chef::EncryptedDataBagItem.should_receive(:load)
        .with('vagrant', 'secrets', 'item_secret')
        .exactly(1).times
        .and_return(@encrypted_data_bag_item)

      @chef_vault_item.should_receive(:load_keys).with('vagrant', 'secrets_keys').exactly(1).times
      @chef_vault_item.should_receive(:secret).exactly(1).times.and_return('item_secret')
      @chef_vault_item.should_receive(:raw_data=).exactly(1).times
      @encrypted_data_bag_item.should_receive(:to_hash).exactly(1).times
      ChefVault::Item.load('vagrant', 'secrets')
    end
  end
end