class SearchController < ApplicationController
  def index
    
  end
  
  def show    
    page = (params[:page] ||= 1).to_i
    items_per_page = (params[:per_page] ||= 10).to_i
    offset = (page - 1) * items_per_page
    
    # CREATE FRIENDLY SLOT NAMES HASH
    _slots = Hash.new
    _slots["Belt"] = "Belt"
    _slots["Chest"] = "Chest"
    _slots["Feet"] = "Feet"
    _slots["Gloves"] = "Gloves"
    _slots["Helmet"] = "Helmet"
    _slots["Legs"] = "Legs"
    _slots["MainHand"] = "Main Hand"
    _slots["Neck"] = "Neck"
    _slots["OffHand"] = "Off Hand"
    _slots["OneHand"] = "One Hand"
    _slots["Weapon_Ranged"] = "Ranged"
    _slots["Ring"] = "Ring"
    _slots["Shoulders"] = "Shoulders"
    _slots["Trinket"] = "Trinket"
    _slots["TwoHanded"] = "Two Handed"
    
    
    arrReturns = Array.new
    
    arrWeapons = Array.new
    arrArmors = Array.new
    arrPlanarEssences = Array.new
    arrCollectibles = Array.new
    arrConsumables = Array.new
    
    arrWeapons = Weapon.search(params[:q])
    arrArmors = Armor.search(params[:q])
    arrPlanarEssences = Planaressence.search(params[:q])
    arrCollectibles = Collectible.search(params[:q])
    arrConsumables = Consumable.search(params[:q])

    tempweapons = Array.new
    tempweapons = arrWeapons.map do |wpn|
      {
        'id' => wpn.id,
        'name' => wpn.name,
        'icon' => wpn.icon.gsub(/\\/,'/'),
        'requiredlevel' => wpn.requiredlevel,
        'value' => wpn.value,
        'slot' => _slots[wpn.slot],
        'rarity' => wpn.rarity.name,
        'type' => wpn.weapontype.displayname,
        'db' => "Weapon"
      }          
    end

    arrReturns.concat(tempweapons)
    
    temparmors = Array.new
    temparmors = arrArmors.map do |arm|
      {
        'id' => arm.id,
        'name' => arm.name,
        'icon' => arm.icon.gsub(/\\/,'/'),
        'requiredlevel' => arm.requiredlevel,
        'value' => arm.value,
        'slot' => _slots[arm.slot],
        'rarity' => arm.rarity.name,
        'type' => arm.armortype.displayname,
        'db' => "Armor"
      }      
    end

    arrReturns.concat(temparmors)
    
    tempessences = Array.new
    tempessences = arrPlanarEssences.map do |itm|
      {
        'id' => itm.id,
        'name' => itm.name,
        'icon' => itm.icon.gsub(/\\/,'/'),
        'requiredlevel' => itm.requiredlevel,
        'value' => itm.value,
        'slot' => itm.slot,
        'rarity' => itm.rarity.name,
        'type' => itm.itemtype,
        'db' => "Planaressence"
      }      
    end

    arrReturns.concat(tempessences)
    
    tempcollectibles = Array.new
    tempcollectibles = arrCollectibles.map do |itm|
      {
        'id' => itm.id,
        'name' => itm.name,
        'icon' => itm.icon.gsub(/\\/,'/'),
        'requiredlevel' => itm.requiredlevel,
        'value' => itm.value,
        'slot' => itm.itemtype,
        'rarity' => itm.rarity.name,
        'type' => "Collectible",
        'db' => "Collectible"
      }      
    end

    arrReturns.concat(tempcollectibles)
    
    tempconsumables = Array.new
    tempconsumables = arrConsumables.map do |itm|
      {
        'id' => itm.id,
        'name' => itm.name,
        'icon' => itm.icon.gsub(/\\/,'/'),
        'requiredlevel' => itm.requiredlevel,
        'value' => itm.value,
        'slot' => itm.itemtype,
        'rarity' => itm.rarity.name,
        'type' => "Consumable",
        'db' => "Consumable"
      }      
    end

    arrReturns.concat(tempconsumables)
    
    @results = WillPaginate::Collection.create(page, items_per_page, arrReturns.length) do |pager|
      pager.replace(arrReturns[pager.offset, pager.per_page])
    end

  end

end
