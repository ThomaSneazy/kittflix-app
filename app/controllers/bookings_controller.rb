class BookingsController < ApplicationController


  def create
    @booking = Booking.new(booking_params)
    @vehicle = Vehicle.find(params[:vehicle_id])
    @vehicle.available = false
    @booking.vehicle = @vehicle
    @booking.save
    redirect_to root_path, notice: "Successfully booked"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :full_price, :vehicle, :user)
end
