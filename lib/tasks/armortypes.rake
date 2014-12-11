namespace :db do
  desc "Erase and fill database"
  task :armortypes => :environment do
    require 'nokogiri'
    
    [Armortype].each(&:delete_all)
    
    xml = Nokogiri::XML(File.open("Items.xml"))
    
    #Add Weapon Types to Table
    @armortypes = xml.xpath('//Item/ArmorType').collect(&:text).uniq.sort
      @armortypes.each do |i|
        Armortype.create(:name => i)
      end
    
  end
end