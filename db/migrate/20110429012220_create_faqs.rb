class CreateFaqs < ActiveRecord::Migration
  def self.up
    create_table :faqs do |t|
      t.text :hobby,      :default => ""
      t.text :music,      :default => ""
      t.text :movie,      :default => ""
      t.text :sport,      :default => ""
      t.text :book,       :default => ""
      t.text :skill,      :default => ""
      t.text :idol,       :default => ""
    end 
  end

  def self.down
    drop_table :faqs
  end
end
