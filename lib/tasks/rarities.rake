namespace :db do
  desc "Erase and fill database"
  task :rarities => :environment do
  
  Rarity.create ([{:name => "Trash"}, {:name => "Common"}, {:name => "Uncommon"}, {:name => "Rare"}, {:name => "Epic"}, {:name => "Relic"}, {:name => "Quest Item"}])
  
  end 
end