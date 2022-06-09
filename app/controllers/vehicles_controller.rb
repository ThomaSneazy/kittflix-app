class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  def index
    @vehicles = Vehicle.all
    if user_signed_in?
      current_user.vehicles.each do |vehicle|
        to_validated = vehicle.bookings.select { |el| el.validated == false }.count
        flash.alert = "You got #{to_validated} Rent#{to_validated > 1 ? 's' : ''} to validated" if to_validated.positive?
      end
      validated = current_user.bookings.last
      flash.alert = "Your booking of #{validated.vehicle.name} have been confirm by #{validated.vehicle.user.email}" if validated.validated == true
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    @booking = Booking.new
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    @vehicle.save
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @vehicle.update(vehicle_params)

    redirect_to vehicle_path(@vehicle)
  end

  def destroy
    @vehicle.destroy

    redirect_to vehicles_path
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :price_per_day, :year, :category, :description, :user_id, photos: [])
  end
end
