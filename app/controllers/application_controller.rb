class ApplicationController < ActionController::Base
  protect_from_forgery

  
  #如果有一个参数是提交操作，那么返回true
    def param_posted?(sym)
      request.post? and params[sym]
    end

 end
