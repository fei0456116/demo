class Admin::CastsController < ApplicationController
  
  def index
    @casts = Cast.all
  end

  def show
    @cast = Cast.find(params[:id])
  end
  
  def new
    @cast = Cast.new
  end

  def create
    @cast = Cast.new(params[:cast])
    if @cast.save
      redirect_to :action => "index"
    else
      render :action => 'new'
    end
  end

  def edit
    @cast = Cast.find(params[:id])
  end

  def update
    @cast = Cast.find(params[:id])
    if @cast.update_attributes(params[:cast])
      redirect_to :action => "index"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @cast = Cast.find(params[:id])
    @cast.destroy
    redirect_to :action => "index"
  end
end
