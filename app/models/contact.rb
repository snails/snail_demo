# == Schema Information
# Schema version: 20110428135724
#
# Table name: contacts
#
#  id      :integer(4)      not null, primary key
#  user_id :integer(4)
#  qq      :string(255)     default("")
#  msn     :string(255)     default("")
#  phone   :string(255)     default("")
#  email   :string(255)     default("")
#  site    :string(255)     default("")
#

#encoding: utf-8
class Contact < ActiveRecord::Base
  #设置关联
  belongs_to :user
  #定义常量
  ALL_FIELDS = %w(qq msn phone email site)

  #定义可访问性
  attr_accessible :qq, :msn, :phone, :email, :site

  #定义校验
  #
end
