class BookingsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car
    if @booking.save
      redirect_to car_booking_path(@car, @booking)
    else
      flash[:alert] = "Booking was not created!"
      render 'cars/show'
    end

    def show
      # Currently shows all user bookings, change to current only
      @booking = Booking.find(params[:car_id])
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :total_days, :car_id)
  end
end
