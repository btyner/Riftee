class Consumable < ActiveRecord::Base
  belongs_to :rarity
  belongs_to :soulboundtrigger
  
  serialize :allowed
  
   def self.search(query)
    if query
      select("id, name, requiredlevel, icon, itemtype, value, rarity_id").where("name LIKE ?", "%#{query}%")
    end
  end
  
  def self.retrieve(query)
    if query
      find(query)
    end
  end
  
end
