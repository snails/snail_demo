#encoding:utf-8
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.xml {render :xml => @user}
    end
  end
  
  def index
    @users = User.paginate(:per_page => 20, :page => params[:page])
     respond_to do |format|
      format.html
      format.xml {render :xml => @users}
     end
    end
end

