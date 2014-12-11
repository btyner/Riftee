class Rune < ActiveRecord::Base
  belongs_to :rarity
  belongs_to :runeallowedslot
  belongs_to :abilitymod
  
end
