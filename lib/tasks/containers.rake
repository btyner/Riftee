namespace :db do
  desc "Erase and fill database"
  task :containers => :environment do
    require 'nokogiri'
    
    [Container].each(&:delete_all)
    
    xml = Nokogiri::XML(File.open("items.xml"))
    
    xml.xpath('//Item[ContainerSlots]').map do |n|
      
      x = Collectible.new
      x.itemkey = n.xpath('ItemKey').text
      x.name = n.xpath('Name/English').text
      x.value = n.xpath('Value').text        
      x.icon = n.xpath('Icon').text
      x.description = n.xpath('Description/English').text
      x.containerslots = n.xpath('ContainerSlots').text
            
      # Lookup Rarity ID to add
        arrRarity = Rarity.select('id').where("name = ?",n.xpath('Rarity').text)
        arrRarity.each do |i|
          @keyRarity = i.id
        end  
        x.rarities_id = @keyRarity
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