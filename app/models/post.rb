# == Schema Information
# Schema version: 20110509011902
#
# Table name: posts
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  attr_accessible :title, :body, :user_id

  belongs_to :user
  has_many :comments, :dependent => :destroy
end
