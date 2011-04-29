# == Schema Information
# Schema version: 20110427021741
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  admin                  :boolean(1)
#  name                   :string(255)
#  actived                :boolean(1)
#

class User < ActiveRecord::Base
  #个人信息关联
  has_one :faq,     :dependent => :destroy
  #关联基本资料spec
  has_one :spec,    :dependent => :destroy
  #关联联系方式contact
  has_one :contact, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  #attributes Validation 
  validates :name,:presence => true,:length => {:within => 2..10 }
  #email格式匹配在devise.rb中进行了配置
end
