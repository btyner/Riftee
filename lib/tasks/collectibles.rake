namespace :db do
  desc "Erase and fill database"
  task :collectibles => :environment do
    require 'nokogiri'
    
    [Collectible].each(&:delete_all)
    
    xml = Nokogiri::XML(File.open("items.xml"))
    
    xml.xpath('//Item[Collectible]').map do |n|
      
      x = Collectible.new
      x.itemkey = n.xpath('ItemKey').text
      x.name = n.xpath('Name/English').text
      x.flavortext = n.xpath('FlavorText/English').text
      x.value = n.xpath('Value').text        
      x.icon = n.xpath('Icon').text
      x.description = n.xpath('Description/English').text
      x.onuse = n.xpath('OnUse/Ability/English').text
      x.itemtype = n.xpath('Collectible').text
      x.maxstacksize = n.xpath('MaxStackSize').text
      x.requiredlevel = n.xpath('RequiredLevel').text
      x.requiredfaction = n.xpath('RequiredFaction').text
      x.requiredfactionlevel = n.xpath('RequiredFactionLevel').text
            
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