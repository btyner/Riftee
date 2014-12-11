class ItemajaxController < ApplicationController
  def index
    database = params[:db]
    id = params[:id]
    
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
    
    _factionlevel = Array.new
    _factionlevel = ["Neutral", "Friendly", "Decorated", "Honored", "Revered", "Glorified"]
    
    @arrItem = Array.new
    @arrItem = eval(database).retrieve(id)
    
    if !@arrItem["armortype_id"].blank?
      @arrItem["type"] = @arrItem.armortype.displayname
    end
    if !@arrItem["weapontype_id"].blank?
      @arrItem["type"] = @arrItem.weapontype.displayname
    end
    @arrItem["slot"] = _slots[@arrItem["slot"]]
    
    case database
    when "Collectible"
      @arrItem["type"] = "Collectible"
      @arrItem["slot"] = @arrItem["itemtype"]
    when "Consumable"
      @arrItem["type"] = "Consumable"
      @arrItem["slot"] = @arrItem["itemtype"]
    end
    
    @arrItem["rarity"] = @arrItem.rarity.name
    if !@arrItem["soulboundtrigger_id"].blank?
      @arrItem["soulboundtrigger"] = @arrItem.soulboundtrigger.displayname
    end
    if !@arrItem["requiredfactionlevel"].blank?
      @arrItem["requiredfactionlevel"] = _factionlevel[@arrItem["requiredfactionlevel"]]
    end
    if !@arrItem["speed"].blank?
      @arrItem["dps"] = ((((@arrItem["maximumdamage"] - @arrItem["minimumdamage"])/2)+@arrItem["minimumdamage"])/@arrItem["speed"]).ceil
      @arrItem["dmgspecs"] = "#{@arrItem["minimumdamage"]}-#{@arrItem["maximumdamage"]} damage every #{@arrItem["speed"]} seconds"
    end
    tempAtt = Array.new
    tempAtt = Enhancement.select("attribute_id, value").where("itemkey = ?", @arrItem["itemkey"])
    
    @arrItem["attributes"] = tempAtt.map do |att|
      {
        'name' => att.attribute.displayname,
        'value' => att.value
      }
    end 
        
    respond_to do |format|
      format.html
    end
    
  end
end
