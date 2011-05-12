#encoding: utf-8
module FriendshipHelper
  #返回好友关系状态
  def friendship_status(user,friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user,friend)
    return "#{friend.name} is not your friend yet." if friendship.nil?

    case friendship.status
    when 'accepted'
      "#{friend.name} is your friend now."
    when 'requested'
      "#{friend.name} would like to be your friend."
    when 'pending'
      "You have send a friendship request to #{friend.name}."
    end
  end

end
