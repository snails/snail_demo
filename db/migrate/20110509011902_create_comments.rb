class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id,             :default => -1
      t.integer :photo_id,            :default => -1
      t.integer :post_id,             :default => -1
      t.string :commentor
      t.integer :commentor_id,        :null => false
      t.text :body
      t.integer :type

      t.datetime :created_at
    end

    add_index :comments,[:user_id, :photo_id, :post_id]
  end

  def self.down
    drop_table :comments
  end
end
