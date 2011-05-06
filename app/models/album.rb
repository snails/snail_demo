# == Schema Information
# Schema version: 20110505023421
#
# Table name: albums
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)      default(-1)
#  group_id    :integer(4)      default(-1)
#  name        :string(255)
#  description :string(255)     default("")
#  total       :integer(4)
#  privacy     :boolean(1)
#  created_at  :datetime
#  updated_at  :datetime
#

#encoding: utf-8
#
class Album < ActiveRecord::Base
  #设置关联关系
  belongs_to :user
  #包含多个Photo
  has_many :photos
  
end
