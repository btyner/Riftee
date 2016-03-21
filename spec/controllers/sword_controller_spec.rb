$:<< File.join(File.dirname(__FILE__), '../..', 'app/controllers')
require 'sword_controller'

describe 'POST sword/create' do
  context 'when name is invalid' do
    it 'redirects to new with error' do
      post 'sword/create', params: { name: '', flavortext: 'This is a test.', platinum: '10', gold: '20', silver: '30', slot: 'OneHand', icon: 'item_icons/1h_sword_015', speed: '1.6', mindmg: '16', maxdmg: '28', requiredlevel: '50', runebreak: '60', rarity: '4', soulbound: '1', weapontype: '24' }

      expect(response).to redirect_to action: :new
      expect(flash[:alert]).to match(/^Save Not Successful./)
    end
  end

  context 'when everything is correct' do
    it 'successfully creates sword and redirects to new with confirmation' do
      post 'sword/create', params: { name: 'RSpec Test', flavortext: 'This is a test.', platinum: '10', gold: '20', silver: '30', slot: 'OneHand', icon: 'item_icons/1h_sword_015', speed: '1.6', mindmg: '16', maxdmg: '28', requiredlevel: '50', runebreak: '60', rarity: '4', soulbound: '1', weapontype: '24' }

      expect(response).to redirect_to action: :new
      expect(flash[:notice]).to match(/^Sword Successfully Saved./)
    end
  end
end