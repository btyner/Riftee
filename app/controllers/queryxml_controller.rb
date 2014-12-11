class QueryxmlController < ApplicationController
  def index
    if !params[:q].blank?
      query = params[:q]
      
      require 'Nokogiri'
      
      doc = Nokogiri::XML(File.open("items.xml"))
      
      @xml = doc.xpath(query).to_xml
      
      
    end
  end

end
