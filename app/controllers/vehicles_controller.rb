class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    authorize @vehicle
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.save
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def destroy
    @vehicle = vehicle.find(params[:id])
    @vehicle.destroy

    redirect_to vehicles_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :price_per_day, :year, :category, :description, photos: [])
  end
end
