class CreateSpecs < ActiveRecord::Migration
  def self.up
    create_table :specs do |t|
      t.integer :user_id,           :null => false
      t.string :gender
      t.date :birthdate
      t.string :city,               :default => ''
      t.string :occupatation,               :default => '' 
    end
    
    #t添加索引
    add_index :specs,:user_id,      :uniqune => true
  end

  def self.down
    drop_table :specs
  end
end
