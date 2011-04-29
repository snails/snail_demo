#encoding: utf-8
class ProfileController < ApplicationController
  def index
    @title = '用户资料'
  end

  def show
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    if @user
      @title = "#{@user.name}的资料"
      @spec = ( @user.spec || Spec.new)
    else
      flash.now[:notice] = "No user #{user_id} found!"
      @title = '用户资料'
    end
  end

end
