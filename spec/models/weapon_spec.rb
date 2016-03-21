require 'spec_helper'

$:<< File.join(File.dirname(__FILE__), '../..', 'app/models')
require 'weapon'

describe Weapon do
	context 'Add New Sword' do
		let (:newsword) { Weapon.new }

		it 'Should set sword name' do
			newsword.name = 'RSpec Weapon Test'
			expect(newsword.name).to eq 'RSpec Weapon Test'
		end
		it 'Should set sword flavor text' do
			newsword.flavortext = 'This is a test.'
			expect(newsword.flavortext).to eq 'This is a test.'
		end
		it 'Should set sword value' do
			newsword.value = 102030
			expect(newsword.value).to eq 102030
		end
		it 'Should set sword slot' do
			newsword.slot = 'OneHand'
			expect(newsword.slot).to eq 'OneHand'
		end
		it 'Should set sword icon' do
			newsword.icon = 'item_icons/1h_sword_015'
			expect(newsword.icon).to eq 'item_icons/1h_sword_015'
		end
		it 'Should set sword speed' do
			newsword.speed = 1.6
			expect(newsword.speed).to eq 1.6
		end
		it 'Should set sword range' do
			newsword.range = 3
			expect(newsword.range).to eq 3
		end
		it 'Should set sword minimum damage' do
			newsword.minimumdamage = 18
			expect(newsword.minimumdamage).to eq 18
		end
		it 'Should set sword maximum damage' do
			newsword.maximumdamage = 32
			expect(newsword.maximumdamage).to eq 32
		end
		it 'Should set sword required level' do
			newsword.requiredlevel = 44
			expect(newsword.requiredlevel).to eq 44
		end
		it 'Should set sword runebreak skill level' do
			newsword.runebreakskilllevel = 100
			expect(newsword.runebreakskilllevel).to eq 100
		end
		it 'Should set sword rarity' do
			newsword.rarity_id = 4
			expect(newsword.rarity_id).to eq 4
		end
		it 'Should set sword soulbound trigger' do
			newsword.soulboundtrigger_id = 1
			expect(newsword.soulboundtrigger_id).to eq 1
		end
		it 'Should set sword weapon type' do
			newsword.weapontype_id = 24
			expect(newsword.weapontype_id).to eq 24
		end
	end
end