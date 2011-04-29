#encoding: utf-8
class FaqController < ApplicationController
  before_filter :authenticate_user!

  def index
    @title = '兴趣爱好'
  end

  def edit
    @title = '兴趣爱好修改'
    @user = current_user
    @user.faq ||=Faq.new
    @faq = @user.faq
    @faq_path = '/users/'+@user.id.to_s+"/faq/edit"

    if param_posted?(:faq)
      if @user.faq.update_attributes(params[:faq])
        flash[:notice] = 'FAQ Updated Successfully!'
        redirect_to :controller => 'profile',:action => 'show',:id => @user.id
        end
    end

  end

end
