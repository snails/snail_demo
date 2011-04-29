class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :user_id
      t.string :qq,                     :default => ''
      t.string :msn,                    :default => ''
      t.string :phone,                  :default => ''
      t.string :email,                  :default => ''
      t.string :site,                   :default => ''
    end
    add_index :contacts,:user_id,         :uniquene => true
  end

  def self.down
    drop_table :contacts
  end
end
