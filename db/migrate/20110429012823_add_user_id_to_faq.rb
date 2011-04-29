class AddUserIdToFaq < ActiveRecord::Migration
  def self.up
    add_column :faqs, :user_id, :integer
    add_index :faqs,:user_id, :uniquene => true
  end

  def self.down
    remove_index :faqs, :user_id
    remove_column :faqs, :user_id
  end
end
