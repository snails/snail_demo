class PagesController < ApplicationController
  def home
    @user = User.first
  end

  def about
  end

  def help
  end

end
