class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @cars = Car.search_by_brand_and_model(params[:query])
    else
      @cars = Car.all
    end
    #Geocoder
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { car: car }),
        image_url: helpers.asset_url("car.png")
      }
    end

  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save!
      flash[:alert] = "Car added sucessfully!"
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      flash[:alert] = "Car updated sucessfully!"
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    flash[:alert] = "Car deleted!"
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :price_per_day, :photo, :address)
  end
end
