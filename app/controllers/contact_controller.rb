#encoding: utf-8
class ContactController < ApplicationController
  before_filter :authenticate_user!

  def index
    @title = '联系方式'
  end

  def edit
    @title = '联系方式修改'
    @user = current_user
    @user.contact ||= Contact.new
    @contact = @user.contact
    @contact_path = '/users/'+@user.id.to_s+"/contact/edit"

    if param_posted?(:contact)
      if @user.contact.update_attributes(params[:contact])
        flash.now[:notice] = 'Contact Changed Successfully!'
        redirect_to :controller => :profile, :action => 'show', :id => @user.id
      end
    end
  end

=begin
  private
   #如果有一个参数是提交操作，那么返回true
    def param_posted?(sym)
      request.post? and params[sym]
    end
=end

end
