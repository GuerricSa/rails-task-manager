class RestaurantsController < ApplicationController
  # find restau :show, :update, :edit, :destroy
  before_action :set_restaurant, only: [:show, :update, :edit, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)

    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    # recuperer le bon restaurant
    # detruire le restaurant
    @restaurant.destroy
    # redirige vers l index

    redirect_to root_path, status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    # strong params
     params.require(:restaurant).permit(:name, :address, :rating)
  end

end
