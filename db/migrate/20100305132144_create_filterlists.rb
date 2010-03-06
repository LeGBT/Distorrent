class CreateFilterlists < ActiveRecord::Migration
  def self.up
    create_table :filterlists do |t|
      t.string :name
      t.string :regexp
      t.integer :ep

      t.timestamps
    end
  end

  def self.down
    drop_table :filterlists
  end
end
