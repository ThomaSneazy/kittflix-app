class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query"
      @vehicles = Vehicle.where(sql_query, query: "%#{params[:query]}%")
    else
      @vehicles = Vehicle.all
    end
    if user_signed_in?
      current_user.vehicles.each do |vehicle|
        to_validated = vehicle.bookings.select { |el| el.validated == false }.count
        flash.alert = "You got #{to_validated} Rent#{to_validated > 1 ? 's' : ''} to validated" if to_validated.positive?
      end
      validated = current_user.bookings.last
      if validated
        flash.alert = "Your booking of #{validated.vehicle.name} have been confirm by #{validated.vehicle.user.email}" if validated.validated == true
      end
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    @booking = Booking.new
    @reviews = []
    @review = Review.new(vehicle: @vehicle)
    @vehicle.reviews.each do |review|
      @reviews << Review.find_by(id: review)
    end
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
