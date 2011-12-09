class PagerController < ApplicationController
  respond_to :html, :json, :js
  
  def index
    respond_with do |format|
      format.html
      format.json { 
        t = User.order("position").page(params[:page]).per(3)
        render  :json => {:results => t.to_json, :pagecount => t.num_pages, :pagenumber => params[:page].to_i}
      }
    end
  end
end
