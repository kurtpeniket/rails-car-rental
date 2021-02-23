class CarsController < ApplicationController
  def index
    @car = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save
    # redirect_to cars#index
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :price_per_day)
  end
end
