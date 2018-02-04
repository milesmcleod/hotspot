class Api::SpotsController < ApplicationController

  def index
    @spots = Spot.all
    render :index
  end

  def show
    @spot = Spot.find(params[:id])
    render :show
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.sender_id = current_user.id
    if @spot.save
      render :show
    else
      render json: @spot.errors.full_messages, status: 422
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot
      if @spot.update_attributes(spot_params)
        render :show
      else
        render json: @spot.errors.full_messages, status: 422
      end
    else
      render json: ['Could not find spot.'], status: 404
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    if @spot
      @spot.delete
      render :show
    else
      render json: ['Could not find spot.'], status: 404
    end
  end

  private

  def spot_params
    params.require(:spot).permit(
      :yelp_name
    )
  end
end
