namespace :db do
  desc "Erase and fill database"
  task :armors => :environment do
    require 'nokogiri'
    
    [Armor].each(&:delete_all)
    
    xml = Nokogiri::XML(File.open("items.xml"))
    
    xml.xpath('//Item[Armor]').map do |n|
        
        arm = Armor.new
        arm.itemkey = n.xpath('ItemKey').text
        arm.name = n.xpath('Name/English').text
        arm.flavortext = n.xpath('FlavorText/English').text
        arm.value = n.xpath('Value').text        
        arm.icon = n.xpath('Icon').text
        arm.slot = n.xpath('Slot').text
        arm.armor = n.xpath('Armor').text
        arm.requiredlevel = n.xpath('RequiredLevel').text
        arm.runebreakskilllevel = n.xpath('RunebreakSkillLevel').text
        arm.requiredpvprank = n.xpath('RequiredPvpRank').text        
        # Lookup Armor Type ID to add
        arrArmor = Armortype.select('id').where("name = ?",n.xpath('ArmorType').text)
        arrArmor.each do |i|
          @keyArmor = i.id
        end         
        arm.armortypes_id = @keyArmor
        # Lookup Rarity ID to add
        arrRarity = Rarity.select('id').where("name = ?",n.xpath('Rarity').text)
        arrRarity.each do |i|
          @keyRarity = i.id
        end  
        arm.rarities_id = @keyRarity
        # Lookup SoulboundTrigger ID to add
        arrST = Soulboundtrigger.select('id').where("name = ?",n.xpath('SoulboundTrigger').text)
        arrST.each do |i|
          @keyST = i.id
        end  
        arm.soulboundtriggers_id = @keyST
        
        arm.save
                
    end
  end
end