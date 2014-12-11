namespace :db do
  desc "Erase and fill database"
  task :attributes => :environment do
    require 'nokogiri'
    
    [Attribute].each(&:delete_all)
    
    xml = Nokogiri::XML(File.open("Items.xml"))
    
    #Add Attributes to Table
    @attributes = xml.xpath('//OnEquip/*').to_a.map { |node| node.node_name }.uniq.sort
      @attributes.each do |i|
        if (i != "Ability")
          Attribute.create(:name => i)
        end
      end
    
  end
end