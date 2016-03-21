class Container < ActiveRecord::Base
  belongs_to :rarity
  belongs_to :soulboundtrigger

  def self.search(query)
    if query
      select("id, name, icon, value, rarity_id, containerslots").where("name LIKE ?", "%#{query}%")
    end
  end

  def self.retrieve(query)
    if query
      find(query)
    end
  end
  
end
