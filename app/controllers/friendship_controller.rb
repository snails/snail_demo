#encoding: utf-8
class FriendshipController < ApplicationController
  before_filter :get_user_and_friend, :except => [:index]

  def index
    @title = '所有好友'
    @user = User.find(params[:user_id])
    @friends = @user.friends
    @requested_friends = @user.requested_friends
    @pending_friends = @user.pending_friends

    respond_to do |format| 
      format.html
      format.xml { render :xml => [@friends,@requested_friends,@pending_friends]}
    end
  end

  #创建好友请求
  def create
    Friendship.request(@user,@friend)

    respond_to do |format|
      format.html {redirect_to request.url, :notice => 'Request have sent.' }
      format.js
    end

  end

  #接受好友请求
  def accept
    @user = current_user
    @friend = User.find(params[:friend_id])

    respond_to do |foramt|

      if @user.requested_friends.include?(@friend)
        Friendship.accept(@user,@friend)
        format.html {redirect_to request.url, 
          :notice => "Friendship with #{@friend.name} accepted!" }
      else
        format.html { redirect_to request.url, 
          :notice =>  "No friendship request from #{@friend.name}." }
      end
    end

  end

  #拒绝好友请求
  def decline

    respond_to do |format|
      if @user.requested_friends.include?(@friend)
        Friendship.breakup(@user,@friend)
        format.html{redirect_to request.url,
          :notice => "Friendship with #{@friend.name} declined."}
        format.js
      else
        format.html{redirect_to request.url,
          :notice => "No friendshiiip request from #{@friend.name}."}
      end
    end
  end

  #取消好友请求
  def cancel
    respond_to do |format|
      if @user.pending_friends.include?(@friend)
        Friendship.breakup(@user,@friend)
        format.html{redirect_to request.url,
          :notice => "Friendship request canceled." }
        format.js
      else
        format.html{redirect_to request.url,
          :notice => "No request for friendship with #{@friend.name}"}
      end
    end
  end

  #删除好友关系
  def delete
    respond_to do |format|
      if @user.friends.include?(@friend)
        Friendship.breakup(@user,@friend)
        format.html{redirect_to request.url,
          :notice => "Friendship request canceled." }
        format.js
      else
        format.html{redirect_to request.url,
          :notice => "You aren't friend with #{@friend.name}'"}
      end
    end
  end

  private
  def get_user_and_friend
    @user = current_user    
    @friend = User.find_by_id(params[:id])
  end

end
