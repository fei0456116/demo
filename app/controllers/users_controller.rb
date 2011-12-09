class UsersController < ApplicationController
  
  respond_to :html, :json, :js
  
  def index
    respond_with do |format|
      format.html
      format.json { 
        t = User.order("position").page(params[:page]).per(6)
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
      redirect_to @user, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :notice => "Successfully destroyed user."
  end
end
