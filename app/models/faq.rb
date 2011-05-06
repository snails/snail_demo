# == Schema Information
# Schema version: 20110505023421
#
# Table name: faqs
#
#  id      :integer(4)      not null, primary key
#  hobby   :text
#  music   :text
#  movie   :text
#  sport   :text
#  book    :text
#  skill   :text
#  idol    :text
#  user_id :integer(4)
#

# == Schema Information
# Schema version: 20110429012823
#
# Table name: faqs
#
#  id      :integer(4)      not null, primary key
#  hobby   :text 爱好
#  music   :text 音乐
#  movie   :text 电影
#  sport   :text 运动
#  book    :text 书籍
#  skill   :text 特长
#  idol    :text 偶像
#  user_id :integer(4)
#
#encoding: utf-8
class Faq < ActiveRecord::Base
  #添加关联
  belongs_to :user

  #定义常量
  ALL_FIELDS = %w(hobby music movie sport book skill idol)
  TEXT_ROWS = 10
  TEXT_COLS = 40

  #定义校验
  validates_length_of ALL_FIELDS,
                      :maximum => 300
  #定义initialize函数，因为mysql不允许text字段有除了null之外的默认值.
  def initialize
    super #父类的构造方法
    ALL_FIELDS.each do |field|
      self[field] = ''
    end
  end

end
