class Recipeitem < ActiveRecord::Base
  belongs_to :rarity
  belongs_to :soulboundtrigger
  
end