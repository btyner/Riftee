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

    @arrItem = eval(database).find(id)

    @filtered = Hash.new
    
    if !@arrItem["armortype_id"].blank?
      @filtered["type"] = @arrItem.armortype.displayname
    end
    if !@arrItem["weapontype_id"].blank?
      @filtered["type"] = @arrItem.weapontype.displayname
    end
    if !@arrItem["slot"].blank?
      @filtered["slot"] = _slots[@arrItem["slot"]]
    end
    
    case database
    when "Collectible"
      @filtered["type"] = "Collectible"
      @filtered["slot"] = @arrItem["itemtype"]
    when "Consumable"
      @filtered["type"] = "Consumable"
      @filtered["slot"] = @arrItem["itemtype"]
    end
    
    @filtered["rarity"] = @arrItem.rarity.name
    if !@arrItem["soulboundtrigger_id"].blank?
      @filtered["soulboundtrigger"] = @arrItem.soulboundtrigger.displayname
    end
    if !@arrItem["requiredfactionlevel"].blank?
      @arrItem["requiredfactionlevel"] = _factionlevel[@arrItem["requiredfactionlevel"]]
    end
    if !@arrItem["speed"].blank?
      @filtered["dps"] = ((((@arrItem["maximumdamage"] - @arrItem["minimumdamage"])/2)+@arrItem["minimumdamage"])/@arrItem["speed"]).ceil
      @filtered["dmgspecs"] = "#{@arrItem["minimumdamage"]}-#{@arrItem["maximumdamage"]} damage every #{@arrItem["speed"]} seconds"
    end
    #tempAtt = Array.new
    #tempAtt = Enhancement.select("attribute_id, value").where("itemkey = ?", @arrItem["itemkey"])
    
=begin
    @arrItem["attributes"] = tempAtt.map do |att|
      {
        'name' => att.attribute.displayname,
        'value' => att.value
      }
    end
=end
        
    respond_to do |format|
      format.html
    end
    
  end
end
