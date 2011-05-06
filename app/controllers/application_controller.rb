class ApplicationController < ActionController::Base
  protect_from_forgery

 #  #Get the current_user from the models
  # def get_curent_user_to_model
    # Photo.get_curent_user_to_model = current_user
  # end
  
  #如果有一个参数是提交操作，那么返回true
    def param_posted?(sym)
      request.post? and params[sym]
    end

 end
