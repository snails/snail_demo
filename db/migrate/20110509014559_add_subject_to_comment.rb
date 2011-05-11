class AddSubjectToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :subject, :string
  end

  def self.down
    remove_column :comments, :subject
  end
end
