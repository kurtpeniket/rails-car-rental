class BookingsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car
    if @booking.save
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "Booking was not created!"
      render 'cars/show'
    end
  end

  def index
    @bookings = current_user.bookings
    @cars = Car.all
    # raise
  end

  def show
    @booking = Booking.find(params[:id])
    @car = Car.find(@booking.car_id)
  end

  def approved
    @booking = Booking.find(params[:id])
    @booking.approved = true
    @booking.save
    redirect_to booking_path(@booking)
  end

  def edit
    @booking = Booking.find(params[:id])
    @car = Car.find(@booking.car_id)
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
      flash[:alert] = "Booking updated successfully!"
    else
      flash[:alert] = "Booking was not created!"
      render 'cars/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :total_days, :car_id)
  end
end
