class AddAttributesToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :name, :string
    add_column :users, :actived, :boolean, :default => false
  end
  

  def self.down
    remove_column :users, :actived
    remove_column :users, :name
    remove_column :users, :admin
  end
end
