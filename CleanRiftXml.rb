require 'nokogiri'

xml = Nokogiri::XML(File.open("Items.xml"))

xml.search("//FirstLootedBy").remove
xml.search("//FirstCompletedBy").remove
xml.search("//FirstKilledBy").remove
xml.search("//FirstLearnedBy").remove
xml.search("//French").remove
xml.search("//German").remove
xml.search("//IsAugmented").remove

File.open("items-clean.xml","w") do |x|
  x << xml.to_s.gsub(/\n(\s*\n)+/,"\n")
end

