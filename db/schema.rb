# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110822054640) do

  create_table "armors", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.string   "icon"
    t.string   "flavortext"
    t.integer  "value"
    t.integer  "armor"
    t.integer  "requiredlevel"
    t.integer  "requiredpvprank"
    t.integer  "runebreakskilllevel"
    t.integer  "rarities_id"
    t.integer  "soulboundtriggers_id"
    t.integer  "onequips_id"
    t.integer  "armortypes_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "armortypes", :force => true do |t|
    t.string   "name"
    t.string   "displayname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attributes", :force => true do |t|
    t.string   "name"
    t.string   "displayname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collectibles", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.string   "flavor"
    t.string   "description"
    t.string   "onuse"
    t.integer  "maxstacksize"
    t.integer  "value"
    t.integer  "rarities_id"
    t.integer  "soulboundtriggers_id"
    t.string   "icon"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumables", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.string   "flavortext"
    t.string   "description"
    t.integer  "maxstacksize"
    t.integer  "value"
    t.integer  "rarities_id"
    t.integer  "soulboundtriggers_id"
    t.string   "icon"
    t.string   "onuse"
    t.integer  "charges"
    t.integer  "cooldown"
    t.integer  "requiredlevel"
    t.string   "requiredfaction"
    t.integer  "requiredfactionlevel"
    t.string   "requiredskill"
    t.integer  "requiredskilllevel"
    t.integer  "requiredpvprank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "containers", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.string   "description"
    t.integer  "value"
    t.integer  "raritys_id"
    t.integer  "soulboundtriggers_id"
    t.string   "icon"
    t.integer  "containerslots"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.string   "description"
    t.integer  "value"
    t.integer  "rarities_id"
    t.integer  "soulboundtriggers_id"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enhancements", :force => true do |t|
    t.integer  "attributes_id"
    t.string   "itemkey"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", :force => true do |t|
    t.integer  "recipies_id"
    t.string   "itemkey"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planaressences", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.integer  "value"
    t.integer  "rarities_id"
    t.integer  "soulboundtriggers_id"
    t.string   "icon"
    t.string   "type"
    t.integer  "abilitymods_id"
    t.string   "onequiptext"
    t.integer  "requiredlevel"
    t.string   "requiredcallings"
    t.string   "requiredfaction"
    t.integer  "requiredfactionlevel"
    t.string   "salvageskill"
    t.integer  "salvageskilllevel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planarfocus", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.integer  "value"
    t.integer  "rarities_id"
    t.boolean  "accountbound",         :default => false
    t.integer  "soulboundtriggers_id"
    t.string   "icon"
    t.integer  "greaterslots"
    t.integer  "lesserslots"
    t.integer  "abilitymods_id"
    t.string   "requiredfaction"
    t.integer  "requiredfactionlevel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questitems", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.string   "flavortext"
    t.string   "description"
    t.integer  "maxstacksize"
    t.integer  "value"
    t.integer  "rarities_id"
    t.integer  "soulboundtriggers_id"
    t.string   "icon"
    t.string   "onequiptext"
    t.integer  "cooldown"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rarities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipeitems", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.integer  "value"
    t.integer  "rarities_id"
    t.integer  "soulboundtriggers_id"
    t.string   "icon"
    t.string   "requiredskill"
    t.integer  "requiredskilllevel"
    t.string   "requiredfaction"
    t.integer  "requiredfactionlevel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", :force => true do |t|
    t.integer  "recipeid"
    t.string   "name"
    t.string   "creates"
    t.integer  "quantity"
    t.integer  "ingredients_id"
    t.string   "requiredskill"
    t.integer  "requiredskillpoints"
    t.integer  "highuntil"
    t.integer  "mediumuntil"
    t.integer  "lowuntil"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runeallowedslots", :force => true do |t|
    t.integer  "runes_id"
    t.integer  "slots_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runes", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.integer  "maxstacksize"
    t.integer  "value"
    t.integer  "rarities_id"
    t.string   "icon"
    t.integer  "requireditemlevel"
    t.integer  "runeallowedslots_id"
    t.integer  "abilitymods_id"
    t.integer  "requiredlevel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slots", :force => true do |t|
    t.string   "name"
    t.string   "displayname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "soulboundtriggers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uncategorizeditems", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.integer  "maxstacksize"
    t.integer  "value"
    t.integer  "rarities_id"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapons", :force => true do |t|
    t.string   "itemkey"
    t.string   "name"
    t.string   "flavortext"
    t.integer  "value"
    t.string   "icon"
    t.string   "slot"
    t.decimal  "speed",                :precision => 2, :scale => 1
    t.decimal  "range",                :precision => 2, :scale => 1
    t.integer  "minimumdamage"
    t.integer  "maximumdamage"
    t.integer  "requiredlevel"
    t.integer  "requiredpvprank"
    t.integer  "runebreakskilllevel"
    t.integer  "rarities_id"
    t.integer  "soulboundtriggers_id"
    t.integer  "weapontypes_id"
    t.integer  "enhancements_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapontypes", :force => true do |t|
    t.string   "name"
    t.string   "displayname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
