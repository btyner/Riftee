class Planarfocus < ActiveRecord::Base
  belongs_to :rarity
  belongs_to :soulboundtrigger
  belongs_to :abilitymod
  
end
