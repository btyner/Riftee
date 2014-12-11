class WeaponController < ApplicationController
  def axe
  end

  def dagger
  end

  def mace
    require 'nokogiri'
    
    xml = Nokogiri::XML(File.open("Items.xml"))
    
    #Add Weapon Types to Table
    @weapontypes = xml.xpath('//Item/WeaponType').collect(&:text).uniq.sort

  end

  def sword
        
    require 'nokogiri'
    
    xml = Nokogiri::XML(File.open("sword.xml"))
  
    @weapons = xml.xpath('//Item[WeaponType]').map do |n|
      { 
        'itemkey' => n.xpath('ItemKey').text,
        'name' => n.xpath('Name/English').text,
        'flavortext' => n.xpath('FlavorText/English').text,
        'value' => n.xpath('Value').text,
        'rarity' => Rarity.select('id').where("name = ?",n.xpath('Rarity').text),
        'soulboundtrigger' => Soulboundtrigger.select('id').where("name = ?",n.xpath('SoulboundTrigger').text),
        'icon' => n.xpath('Icon').text,
        'slot' => n.xpath('Slot').text,
        'weapontype' => Weapontype.select('id').where("name = ?",n.xpath('WeaponType').text),
        'minimumdamage' => n.xpath('MinimumDamage').text,
        'maximumdamage' => n.xpath('MaximumDamage').text,
        'speed' => n.xpath('Speed').text,
        'range' => n.xpath('Range').text,
        'requiredlevel' => n.xpath('RequiredLevel').text,
        'runebreakskilllevel' => n.xpath('RunebreakSkillLevel').text,
        'enhancement' => Enhancement.select("id").where("itemkey = ?",n.xpath('ItemKey').text)
      }    

    end
    
  end

end


