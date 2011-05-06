class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :user_id,       :default => -1
      t.integer :group_id,      :default => -1
      t.string :name
      t.string :description,     :default => ""
      t.integer :total
      t.boolean :privacy,       :default => false

      t.timestamps
    end
    add_index :albums, [:user_id,:group_id]
  end

  def self.down
    drop_table :albums
  end
end
