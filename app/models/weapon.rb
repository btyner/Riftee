class Weapon < ActiveRecord::Base
  belongs_to :rarity
  belongs_to :weapontype
  belongs_to :soulboundtrigger
  validates :name, presence: true
  validates :icon, presence: true
  validates :speed, format: { with: /\d{1}\.\d{1}/, message: "Please specify a speed in the format 0.0" }
  validates :minimumdamage, presence: true, numericality: true
  validates :maximumdamage, presence: true, numericality: true
  validates :requiredlevel, presence: true, numericality: true
  validates :runebreakskilllevel, presence: true, numericality: true

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

  def self.swords
    select("id, name, requiredlevel, icon, slot, value, rarity_id, weapontype_id").where(["weapontype_id = ? or weapontype_id = ?", "24", "38"])
  end
  
end
