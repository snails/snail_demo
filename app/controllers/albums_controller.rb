#encoding: utf-8
class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.xml
  def index
    @title = '相册'
    @user = User.find(params[:user_id])
    @albums = @user.albums 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.xml
  def show
    params.each do |key,value|
      puts key.to_s+'-->'+value.to_s
    end
    @user = User.find(params[:user_id]) 
    @album = Album.find(params[:id])
    @title = "相册——#{@album.name}"

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => [@user,@album] }
    end
  end

  # GET /albums/new
  # GET /albums/new.xml
  def new
    @user = current_user
    @album = Album.new
    @title = '新建相册'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => [@user,@album] }
    end
  end

  # GET /albums/1/edit
  def edit
    @user = current_user
    @album = Album.find(params[:id])
    @title = "编辑——#{@album.name}"
  end

  # POST /albums
  # POST /albums.xml
  def create
    @album = Album.new(params[:album])
    @album.user_id = current_user.id
    respond_to do |format|
      if @album.save
        format.html { redirect_to([current_user,@album], :notice => 'Album was successfully created.') }
        format.xml  { render :xml => [current_user,@album], :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.xml
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to([current_user,@album], :notice => 'Album was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.xml
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(user_albums_path) }
      format.xml  { head :ok }
    end
  end
end
