class RemoveIdFromFriendship < ActiveRecord::Migration
  def self.up
    remove_column :friendships, :id
  end

  def self.down
    add_column :friendships, :id
  end
end
