class BookingsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car
    if @booking.save
      redirect_to car_path(@car)
    else
      render 'cars/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :total_days, :car_id)
  end
end
