namespace :db do
  desc "Erase and fill database"
  task :weapons => :environment do
    require 'nokogiri'
    
    [Weapon].each(&:delete_all)
    
    xml = Nokogiri::XML(File.open("items.xml"))
    
    xml.xpath('//Item[WeaponType]').map do |n|
        
        wpn = Weapon.new
        wpn.itemkey = n.xpath('ItemKey').text
        wpn.name = n.xpath('Name/English').text
        wpn.flavortext = n.xpath('FlavorText/English').text
        wpn.value = n.xpath('Value').text        
        wpn.icon = n.xpath('Icon').text
        wpn.slot = n.xpath('Slot').text        
        wpn.minimumdamage = n.xpath('MinimumDamage').text
        wpn.maximumdamage = n.xpath('MaximumDamage').text
        wpn.speed = n.xpath('Speed').text
        wpn.range = n.xpath('Range').text
        wpn.requiredlevel = n.xpath('RequiredLevel').text
        wpn.runebreakskilllevel = n.xpath('RunebreakSkillLevel').text
        wpn.requiredpvprank = n.xpath('RequiredPvpRank').text        
        # Lookup Weapon Type ID to add
        arrWeapon = Weapontype.select('id').where("name = ?",n.xpath('WeaponType').text)
        arrWeapon.each do |i|
          @keyWeapon = i.id
        end         
        wpn.weapontypes_id = @keyWeapon
        # Lookup Rarity ID to add
        arrRarity = Rarity.select('id').where("name = ?",n.xpath('Rarity').text)
        arrRarity.each do |i|
          @keyRarity = i.id
        end  
        wpn.rarities_id = @keyRarity
        # Lookup SoulboundTrigger ID to add
        arrST = Soulboundtrigger.select('id').where("name = ?",n.xpath('SoulboundTrigger').text)
        arrST.each do |i|
          @keyST = i.id
        end  
        wpn.soulboundtriggers_id = @keyST
        
        wpn.save
                
    end
  end
end