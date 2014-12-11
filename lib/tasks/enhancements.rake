namespace :db do
  desc "Erase and fill database"
  task :enhancements => :environment do
    require 'nokogiri'
    
    [Enhancement].each(&:delete_all)
    
    
    arrAttributes = Hash.new
    
    Attribute.all.each do |at|
      arrAttributes[at.name] = at.id
    end
    
    require 'nokogiri'
    
    xml = Nokogiri::XML(File.open("Items.xml"))
    
    @attributes = Array.new
    
    @item = xml.xpath('//Item[OnEquip]').map do |node|
      @itemkey = node.xpath('ItemKey').text
      @tempattributes = node.xpath('OnEquip/*[name(.)!="Ability"]').map do |attr|
        {
          'itemkey' => @itemkey,
          'attribute_id' => arrAttributes[attr.name],
          'value' => attr.text
        }
      end
      @attributes.concat(@tempattributes)
    end
    @attributes.each do |obj|
      e = Enhancement.new      
      e.itemkey = obj['itemkey']
      e.attributes_id = obj['attribute_id']
      e.value = obj['value']
      e.save
    end
  end
end