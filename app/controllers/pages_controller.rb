#encoding: utf-8
class PagesController < ApplicationController
  def home
    @title = '首页'
    if current_user.nil? #如果没有登录，则进行跳转，进行登录
      redirect_to '/login'
    end
    @user = current_user
  end

  def about
    @title = '关于我们'
  end

  def help
    @title = '帮助'
  end

end
