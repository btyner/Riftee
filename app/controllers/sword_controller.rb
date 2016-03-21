class SwordController < ApplicationController
  def index

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

    arrWeapons = Weapon.swords

    arrReturns = arrWeapons.map do |wpn|
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

    @results = WillPaginate::Collection.create(page, items_per_page, arrReturns.length) do |pager|
      pager.replace(arrReturns[pager.offset, pager.per_page])
    end
          
  end
  
  def new

    @slots = {"One Hand" => "OneHand", "Two Handed" => "TwoHanded"}

    @rarities = Rarity.all
    @soulboundtriggers = Soulboundtrigger.all

    @weapontypes = {"One Handed Sword" => 24, "Two Handed Sword" => 38}

    @onehandicons = Dir.glob("public/images/item_icons/1h_sword_*.png")
    @twohandicons = Dir.glob("public/images/item_icons/2h_sword_*.png")

  end

  def create

    wpn = Weapon.new
    wpn.name = params['itemname']
    wpn.flavortext = params['flavortext']
    wpn.value = params['platinum'] + params['gold'] + params['silver']
    wpn.slot = params['slot']
    wpn.icon = params['icon']
    wpn.range = 3
    wpn.speed = params['speed']
    wpn.minimumdamage = params['mindmg']
    wpn.maximumdamage = params['maxdmg']
    wpn.requiredlevel = params['requiredlevel']
    wpn.runebreakskilllevel = params['runebreak']
    wpn.rarity_id = params['rarity']
    wpn.soulboundtrigger_id = params['soulbound']
    wpn.weapontype_id = params['weapontype']

    if wpn.save
      flash[:notice] = "Sword Successfully Saved."
    else
      flash[:alert] = "Save Not Successful."
    end

    redirect_to action: :new

  end
end
