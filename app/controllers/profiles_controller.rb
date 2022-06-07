class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @vehicles = Vehicle.where(user_id: @user.id)
    @bookings = Booking.where(user_id: @user.id)
  end
end
