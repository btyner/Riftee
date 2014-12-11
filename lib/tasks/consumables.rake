namespace :db do
  desc "Erase and fill database"
  task :consumables => :environment do
    require 'nokogiri'
    
    [Consumable].each(&:delete_all)
    
    xml = Nokogiri::XML(File.open("items.xml"))
    
    xml.xpath('//Item[Consumable]').map do |n|
      
      x = Consumable.new
      x.itemkey = n.xpath('ItemKey').text
      x.itemtype = "Miscellaneous"
      x.name = n.xpath('Name/English').text
      x.flavortext = n.xpath('FlavorText/English').text
      x.value = n.xpath('Value').text        
      x.icon = n.xpath('Icon').text
      x.description = n.xpath('Description/English').text
      x.onuse = n.xpath('OnUse/Ability/English').text
      x.maxstacksize = n.xpath('MaxStackSize').text
      x.charges = n.xpath('Charges').text
      x.cooldown = n.xpath('Cooldown').text
      x.requiredlevel = n.xpath('RequiredLevel').text
      x.requiredfaction = n.xpath('RequiredFaction').text
      x.requiredfactionlevel = n.xpath('RequiredFactionLevel').text
      x.requiredsecondaryskill = n.xpath('RequiredSecondarySkill').text
      x.requiredsecondaryskilllevel = n.xpath('RequiredSecondarySkillLevel').text
      
      # Apply ItemTypes
      #Quest Item
      if n.xpath('count(IsQuestItem) > 0')
        x.itemtype = "Quest Item"
      end
      #Recipe
      if n.xpath('count(RequiredSecondarySkill) > 0')
        x.itemtype = "Recipe"
      end
      #Currency
      if n.xpath('count(IsCurrency) > 0')
        x.itemtype = "Currency"
      end
      #Rune (Set up another task to set up Allowed Slots)
      if n.xpath('count(OnUse/RuneAllowedSlots/Slot)>=1')
        arrAllowed = Array.new
          n.xpath('OnUse/RuneAllowedSlots/Slot').each do |i|
            arrAllowed << i.text
          end
          x.allowed = arrAllowed
          x.requireditemlevel = n.xpath('OnUse/RequiredItemLevel').text
          x.itemtype = "Rune"
        
      end
      if n.xpath('count(OnUse/RuneAllowedWeaponType/ItemType)>=1')
        arrAllowed = Array.new
          n.xpath('OnUse/RuneAllowedWeaponType/ItemType').each do |i|
            arrAllowed << i.text
          end
          x.allowed = arrAllowed
          x.requireditemlevel = n.xpath('OnUse/RequiredItemLevel').text
          x.itemtype = "Rune"
      end
      #Regular Inventory
            
      # Lookup Rarity ID to add
        arrRarity = Rarity.select('id').where("name = ?",n.xpath('Rarity').text)
        arrRarity.each do |i|
          @keyRarity = i.id
        end  
        x.rarity_id = @keyRarity
        # Lookup SoulboundTrigger ID to add
        arrST = Soulboundtrigger.select('id').where("name = ?",n.xpath('SoulboundTrigger').text)
        arrST.each do |i|
          @keyST = i.id
        end  
        x.soulboundtrigger_id = @keyST
        
        x.save
      

    end
  end
end