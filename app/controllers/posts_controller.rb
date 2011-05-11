#encoding: utf-8
class PostsController < ApplicationController
  #需要用户登录，才可以进行修改
  before_filter :authenticate_user!


  # GET /posts
  # GET /posts.xml
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.paginate(:per_page => 7, :page => params[:page]) || Comment.new
    

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @user = current_user
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @user = current_user
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @user = current_user
    @post = Post.new(params[:post])
    @post.user = @user

    respond_to do |format|
      if @post.save
        format.html { redirect_to([@user,@post], :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => ([@user,@post]) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @user = current_user
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(([@user,@post]), :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @user = current_user
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(user_posts_url(@user)) }
      format.xml  { head :ok }
    end
  end
end
