class Weapon < ActiveRecord::Base
  belongs_to :rarity
  belongs_to :weapontype
  belongs_to :soulboundtrigger
  
  def self.search(query)
    if query
      select("id, name, requiredlevel, icon, slot, value, rarity_id, weapontype_id").where("name LIKE ?", "%#{query}%")
    end
  end
  
  def self.retrieve(query)
    if query
      find(query)
    end
  end
  
end
