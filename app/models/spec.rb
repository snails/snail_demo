# == Schema Information
# Schema version: 20110428021317
#
# Table name: specs
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)      not null
#  gender       :string(255)
#  birthdate    :date
#  city         :string(255)     default("")
#  occupatation :string(255)     default("")
#

#encoding: utf-8
class Spec < ActiveRecord::Base
  #设置关联
  belongs_to :user

  #校验规则
 # VALID_GENDERS = ['&#x7537;','&#x5973;']
  ALL_FIELDS = %w(gender birthdate city occupatation)
  START_YEAR = 1950
  VALID_DATES = DateTime.new(START_YEAR)..DateTime.now
=begin
  validates_inclusion_of :gender,
                          :in => VALID_GENDERS,
                          :allow_nil => false,
                          :message => 'Must be a gender of Female or Male'
=end

  validates_inclusion_of :birthdate,
                          :in => VALID_DATES,
                          :allow_nil => true

end
