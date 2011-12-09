class UsersController < ApplicationController
  
  respond_to :html, :json, :js
  
  def index
    respond_with do |format|
      format.html
      format.json { 
        t = User.order("position").page(params[:page]).per(10)
        render  :json => {:results => t.to_json, :pagecount => t.num_pages, :pagenumber => params[:page]}
      }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.face = params[:Filedata] if params[:Filedata]

    if @user.save
      redirect_to @user, :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      respond_with do |format|
        format.html {redirect_to @user, :notice  => "Successfully updated user."}
        format.js { render :nothing => true}
      end
    else
      respond_with do |format|
        format.html {render :action => 'edit'}
        format.js { render :nothing => true}
      end
    end
  end
  
  def swfupload
    @user = User.new(params[:user])
    @user.face = params[:Filedata] if params[:Filedata]
    render :text => '"status":true'
  end

  def sort
    params[:user].each_with_index do |id, index|
      User.update_all({:position => index + 1}, {:id => id} )
    end
    render :nothing => true
  end

  def destroy
    @user = User.find(params[:id])
    redirect_to users_url, :notice => "Successfully destroyed user."
  end
end
