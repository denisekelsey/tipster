class PlacesController < ApplicationController
  
  def index
    @places = Place.page(params[:page]).per(5)
  end

  def new
    @places = Place.new
  end

end

