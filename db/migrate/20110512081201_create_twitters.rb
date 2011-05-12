class CreateTwitters < ActiveRecord::Migration
  def self.up
    create_table :twitters do |t|
      t.integer :user_id
      t.text :content
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :twitters
  end
end
