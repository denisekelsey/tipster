class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @places = Place.page(params[:page]).per(5)
  end


  def new
    @place = Place.new
  end


  def create
    @place = current_user.places.create(place_params)
  
    if @place.valid?
       redirect_to Place.last
    else
      render :new, status: :unprocessable_entity
    end

  end


  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
  end


  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render file: Rails.root.join('public', 'not_found.html.erb'), status: :not_found
    end
  end


  def update
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render text: 'Access Not Allowed', status: :forbidden
    end

    @place.update_attributes(place_params)
    if @place.valid?
       redirect_to Place.last
    else
      render :edit, status: :unprocessable_entity
    end

  end


  def destroy
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render text: 'Access Not Allowed', status: :forbidden
    end

    @place.destroy
    redirect_to root_path
  end


  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end

