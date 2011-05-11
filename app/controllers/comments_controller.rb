class CommentsController < ApplicationController
  def index

   end

  def create
    @comment = Comment.new(params[:comment])
    @user = User.find(params[:comment][:user_id])

    respond_to do |format|
      if @comment.save
        format.html {redirect_to(request.url, :notice => 'Comment was sucessfully created.')}
        format.js
      else
        format.html { redirect_to(request.url)}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(request.url)}
      format.js
    end
  end

end
