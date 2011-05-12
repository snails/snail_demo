#encoding: utf-8
# == Schema Information
# Schema version: 20110512081201
#
# Table name: twitters
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  content    :text
#  created_at :datetime
#

class Twitter < ActiveRecord::Base
  #设置关联
  belongs_to :user
end
