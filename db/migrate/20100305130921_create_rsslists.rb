class CreateRsslists < ActiveRecord::Migration
  def self.up
    create_table :rsslists do |t|
      t.string :name
      t.string :adress

      t.timestamps
    end
  end

  def self.down
    drop_table :rsslists
  end
end
