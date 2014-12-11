namespace :db do
  desc "Erase and fill database"
  task :weapons => :environment do
    require 'nokogiri'
    
    [Weapontype].each(&:delete_all)
    
    xml = Nokogiri::XML(File.open("Items.xml"))
    
    #Add Weapon Types to Table
    @weapontypes = xml.xpath('//Item/WeaponType').collect(&:text).uniq.sort
      @weapontypes.each do |i|
        Weapontype.create(:name => i)
      end
=begin      
    xml.xpath('//Item[WeaponType]').map do |n|

        Weapon.itemkey = n.xpath('ItemKey').text
        Weapon.name = n.xpath('Name/English').text
        Weapon.flavortext = n.xpath('FlavorText/English').text
        Weapon.value = n.xpath('Value').text        
        Weapon.icon = n.xpath('Icon').text
        Weapon.slot = n.xpath('Slot').text        
        Weapon.minimumdamage = n.xpath('MinimumDamage').text
        Weapon.maximumdamage = n.xpath('MaximumDamage').text
        Weapon.speed = n.xpath('Speed').text
        Weapon.range = n.xpath('Range').text
        Weapon.requiredlevel = n.xpath('RequiredLevel').text
        Weapon.runebreakskilllevel = n.xpath('RunebreakSkillLevel').text
        
        # Lookup Weapon Type ID to add
        Weapon.weapontypes_id = n.xpath('WeaponType').text
        # Lookup Rarity ID to add
        Weapon.rarities_id = n.xpath('Rarity').text
        # Lookup SoulboundTrigger ID to add
        Weapon.soulboundtriggers_id = n.xpath('SoulboundTrigger').text
        # Adding Item Enhancements
        n.xpath('OnEquip').map do |eq|
          # Add info to save enhancements
        end

    end
=end
    
  end
end