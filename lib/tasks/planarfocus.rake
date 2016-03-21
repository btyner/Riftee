namespace :db do
  desc "Erase and fill database"
  task :planarfocus => :environment do
    require 'nokogiri'
    
    [Planarfocus].each(&:delete_all)
    
    xml = Nokogiri::XML(File.open("items.xml"))
    
    xml.xpath('//Item[RiftVessel]').map do |n|
      
      pf = Planarfocus.new
      pf.itemkey = n.xpath('ItemKey').text
      pf.name = n.xpath('Name/English').text
      pf.value = n.xpath('Value').text        
      pf.icon = n.xpath('Icon').text
      pf.greaterslots = n.xpath('RiftVessel/GreaterSlots').text
      pf.lesserslots = n.xpath('RiftVessel/LesserSlots').text
      pf.requiredfaction = n.xpath('RequiredFaction').text
      pf.requiredfactionlevel = n.xpath('RequiredFactionLevel').text
      
      #puts n.xpath('AccountBound')
      #if n.xpath('AccountBound')
        #pf.accountbound = true  
      #end      
      
      # Lookup Rarity ID to add
        arrRarity = Rarity.select('id').where("name = ?",n.xpath('Rarity').text)
        arrRarity.each do |i|
          @keyRarity = i.id
        end  
        pf.rarities_id = @keyRarity
        # Lookup SoulboundTrigger ID to add
        arrST = Soulboundtrigger.select('id').where("name = ?",n.xpath('SoulboundTrigger').text)
        arrST.each do |i|
          @keyST = i.id
        end  
        pf.soulboundtrigger_id = @keyST
        
        pf.save
      

    end
  end
end