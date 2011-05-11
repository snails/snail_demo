#encoding: utf-8
class PhotosController < ApplicationController
   #需要用户登录，才可以进行修改
  before_filter :authenticate_user!

  # GET /photos
  # GET /photos.xml
  def index
    @user = User.find(params[:user_id])
    @album = Album.find(params[:album_id])
    @photos = @album.photos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @user = User.find(params[:user_id])
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
    puts '**********user_id:'+params[:user_id].to_s+",album_id:"+params[:album_id].to_s+",photo_id:"+params[:id].to_s

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => [@user,@album,@photo] }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @user = current_user
    @album = Album.find(params[:album_id])
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @user = current_user
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @user = current_user
    @album = Album.find(params[:album_id])

    newparams = coerce(params)

    @photo = Photo.new(newparams[:photo])



    respond_to do |format|
      if @photo.save
       # puts '********It is saved****************'
        format.html { redirect_to([@user,@album,@photo], :notice => 'Photo was successfully created.') }
        format.json  { render :json => { :result => 'success', :photo => @photo } }
      else
        redirect_to user_album_url(@user,@album) 
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @user = current_user
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to([@user,@album,@photo], :notice => 'Photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html {  redirect_to user_album_url(@user,@album)  }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @user = current_user
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
    @photo.image.clear
    @photo.destroy


    respond_to do |format|
      format.html { redirect_to(user_album_url([@user,@album])) }
      format.xml  { head :ok }
    end
  end


  private 

  def coerce(params)
    if params[:photo].nil? 
      h = Hash.new 
      h[:photo] = Hash.new 
      h[:photo][:album_id] = params[:album_id] 
      h[:photo][:image] = params[:Filedata] 
      h[:photo][:image].content_type = MIME::Types.type_for(h[:photo][:image].original_filename).to_s
      h
    else 
      params
    end 
  end


end
