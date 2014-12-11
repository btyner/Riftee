class SwordController < ApplicationController
  def index
    
    require 'nokogiri'
    
    xml = Nokogiri::XML(File.open("Items.xml"))
    
    @soulbound = xml.xpath('//Item/SoulboundTrigger').collect(&:text).uniq.sort
          
  end
  
  def test
    @arrAttr = Attribute.count
    
#    Attribute.all.each do |at|
#      @arrAttributes << at.name
#    end
    
  end
end
