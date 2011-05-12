class TwittersController < ApplicationController
  # GET /twitters
  # GET /twitters.xml
  def index
    @user = User.find(params[:user_id])
    @twitters = @user.twitters.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @twitters }
    end
  end

 
  # POST /twitters
  # POST /twitters.xml
  def create    
    @twitter = Twitter.new(params[:twitter])
    
    respond_to do |format|
      if @twitter.save
        format.html { redirect_to(request.url, :notice => 'Twitter was successfully created.') }
        format.xml  { render :xml => @twitter, :status => :created, :location => @twitter }
        format.js
      else
        format.html { redirect_to request.url }
        format.xml  { render :xml => @twitter.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /twitters/1
  # DELETE /twitters/1.xml
  def destroy
    @twitter = Twitter.find(params[:id])
    @twitter.destroy

    respond_to do |format|
      format.html { redirect_to(twitters_url) }
      format.xml  { head :ok }
      format.js
    end
  end
end
