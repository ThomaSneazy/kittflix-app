class ReviewsController < ApplicationController
  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @review = @Review.new
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @review = Review.new(review_params)
    @review.vehicle = @vehicle
    if @review.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to vehicle_path
  end
end

private

def review_params
  params.require(:review).permit(:content, :rating, :vehicle)
end
