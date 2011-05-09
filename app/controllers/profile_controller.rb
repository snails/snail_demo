#encoding: utf-8
class ProfileController < ApplicationController
   #需要用户登录，才可以进行修改
  before_filter :authenticate_user!

  def index
    user_id = params[:user_id]
    @user = User.find_by_id(user_id)
    if @user
      @title = "#{@user.name}的资料"
      @spec = ( @user.spec || Spec.new)
      @contact = (@user.contact || Contact.new)
      @faq = (@user.faq || Faq.new)
    else
      flash[:notice] = "No user #{user_id} found!"
      @title = '用户资料'
    end
  end
end
