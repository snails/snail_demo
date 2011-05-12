# == Schema Information
# Schema version: 20110512071418
#
# Table name: friendships
#
#  user_id     :integer(4)
#  friend_id   :integer(4)
#  status      :string(255)
#  created_at  :datetime
#  accepted_at :datetime
#

class Friendship < ActiveRecord::Base
  #设置关联
  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key => 'friend_id'

  #设置校验
  validates_presence_of :user_id, :friend_id

  #判断2个用户是否是好友关系
  def self.exists?(user,friend)
=begin    if user == friend
      return true;
=end    
    not find_by_user_id_and_friend_id(user,friend).nil?
  end

  #创建好友请求关系
  def self.request(user,friend)
    unless user == friend or Friendship.exists?(user,friend)
      transaction do
        create(:user => user, :friend => friend, :status => 'pending')
        create(:user => friend, :friend => user, :status => 'requested')
      end
    end
  end
  
  #接受好友请求
  def self.accept(user,friend)
    transaction do 
      accepted_at = Time.now
      accept_one_side(user,friend,accepted_at)
      accept_one_side(friend,user,accepted_at)
    end
  end

  #删除好友关系
  def self.breakup(user,friend)
    transaction do
      destroy(find_by_user_id_and_friend_id(friend,user))
      destroy(find_by_user_id_and_friend_id(user,friend))
    end
  end

  private
  #当接受朋友关系时更新数据库
  def self.accept_one_side(user,friend,accepted_at) 
    request = find_by_user_id_and_friend_id(user,friend)
    request.status = 'accepted'
    request.accepted_at = accepted_at
    request.save!
  end
end
