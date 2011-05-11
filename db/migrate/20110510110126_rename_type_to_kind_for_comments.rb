class RenameTypeToKindForComments < ActiveRecord::Migration
  def self.up
    rename_column :comments, :type, :kind
  end

  def self.down
    rename_column :comments, :kind, :type
  end
end
