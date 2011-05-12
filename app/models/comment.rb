# == Schema Information
# Schema version: 20110511091017
#
# Table name: comments
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)      default(-1)
#  photo_id     :integer(4)      default(-1)
#  post_id      :integer(4)      default(-1)
#  commentor    :string(255)
#  commentor_id :integer(4)      not null
#  body         :text
#  kind         :integer(4)
#  created_at   :datetime
#  subject      :string(255)
#

#encoding: utf-8
class Comment < ActiveRecord::Base
  #设置常量,在用户主页留言为1，在博客留言为2，评论图片为3，其它有待添加
  USER_COMMENT = 1
  POST_COMMENT = 2
  PHOTO_COMMENT =3

  #默认排序为按时间倒序
  default_scope order('created_at DESC')

  #设置关联
  belongs_to :user
  belongs_to :post
  belongs_to :photo

  #设置可访问属性
  attr_accessible :user_id, :photo_id, :post_id, :kind, :commentor, :commentor_id, :body, :created_at, :subject

  #设置校验
  validates_presence_of :commentor, :commentor_id, :body

end
