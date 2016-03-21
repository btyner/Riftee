namespace :db do
  desc "Erase and fill database"
  task :planaressences => :environment do
    require 'nokogiri'
    
    [Planaressence].each(&:delete_all)
    
    xml = Nokogiri::XML(File.open("items.xml"))
    
    xml.xpath('//Item[RiftGem]').map do |n|
        
        pe = Planaressence.new
        pe.itemkey = n.xpath('ItemKey').text
        pe.name = n.xpath('Name/English').text
        pe.value = n.xpath('Value').text        
        pe.icon = n.xpath('Icon').text
        pe.slot = "Planar Essence"
        pe.type = n.xpath('RiftGem').text
        pe.requiredlevel = n.xpath('RequiredLevel').text
        pe.runebreakskilllevel = n.xpath('RunebreakSkillLevel').text
        pe.requiredfaction = n.xpath('RequiredFaction').text
        pe.requiredfactionlevel = n.xpath('RequiredFactionLevel').text
        pe.salvageskill = n.xpath('SalvageSkill').text
        pe.salvageskilllevel = n.xpath('SalvageSkillLevel').text        
        pe.onequiptext = n.xpath('OnEquip/Ability/English').text
        
        # Parse Callings
        if n.xpath('RequiredCallings') != nil
          arrCallings = Array.new
          n.xpath('RequiredCallings/Calling').each do |x|
            arrCallings << x.text
          end
          pe.requiredcallings = arrCallings
        end
        
        # Lookup Rarity ID to add
        arrRarity = Rarity.select('id').where("name = ?",n.xpath('Rarity').text)
        arrRarity.each do |i|
          @keyRarity = i.id
        end  
        pe.rarity_id = @keyRarity
        # Lookup SoulboundTrigger ID to add
        arrST = Soulboundtrigger.select('id').where("name = ?",n.xpath('SoulboundTrigger').text)
        arrST.each do |i|
          @keyST = i.id
        end  
        pe.soulboundtrigger_id = @keyST
        
        pe.save
                
    end
  end
end