class Enhancements < ActiveRecord::Migration
  def self.up
    create_table :enhancements do |t|
      t.integer  :attributes_id
      t.string   :itemkey
      t.integer  :value
      t.timestamps
    end
  end

  def self.down
    drop_table :enhancements
  end
end
