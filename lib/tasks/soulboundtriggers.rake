namespace :db do
  desc "Erase and fill database"
  task :soulboundtriggers => :environment do
  
  Soulboundtrigger.create ([{:name => "BindOnEquip"}, {:name => "BindOnPickup"}, {:name => "BindOnUse"}])
  
  end 
end