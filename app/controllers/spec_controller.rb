#encoding: utf-8
class SpecController < ApplicationController
  #需要用户登录，才可以进行修改
  before_filter :authenticate_user!


  def index
    @title = '基本资料'
  end

  def edit
    @title = '基本资料修改'
    @user = current_user
    @user.spec ||= Spec.new
    @spec = @user.spec
    @spec_path = '/users/'+@user.id.to_s+'/spec/edit'

    if param_posted?(:spec) 
      if @user.spec.update_attributes(params[:spec])
        flash.now[:notice] = 'Spec Change '
        redirect_to :controller => 'profile',:action => 'show',:id => @user.id
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
