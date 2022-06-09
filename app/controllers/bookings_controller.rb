class BookingsController < ApplicationController


  def create
    @booking = Booking.new(booking_params)
    @vehicle = Vehicle.find(params[:vehicle_id])
    @vehicle.available = false
    @booking.vehicle = @vehicle
    @booking.save
    @booking.user_id = current_user.id
    number_of_day = @booking.end_date - @booking.start_date
    @booking.full_price = @vehicle.price_per_day * number_of_day.floor
    if @booking.save
      redirect_to profile_path, notice: "Your request have been submited !!!"
    else
      redirect_to vehicle_path(@vehicle), alert: "Something went wrong, try again"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path, alert: "Your booking is deleted"
  end

  def validation
    @booking = Booking.find(params[:id])
    @booking.validated = true
    @booking.save
    redirect_to profile_path, notice: "Your rent is confirmed"
  end
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :full_price, :vehicle, :user)
end
