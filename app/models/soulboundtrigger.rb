class Soulboundtrigger < ActiveRecord::Base
  has_many :weapons
  has_many :armors
  has_many :containers
  has_many :collectibles
  has_many :consumables
  has_many :currencies
  has_many :planaressences
  has_many :planarfocus
  has_many :recipeitems
  has_many :runes
    
end
