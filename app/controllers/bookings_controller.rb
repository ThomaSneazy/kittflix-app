class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking.params)
    @vehicle = Vehicle.find(params[:vehicle_id])
    @vehicle.available = false
    @booking.vehicle = @vehicle
    @booking.save
    redirect_to vehicle_path(@vehicle)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path
  end
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :full_price, :vehicle, :user)
end
