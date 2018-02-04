class Api::ListingsController < ApplicationController

  def index
    @listings = current_user.listings
    render :index
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.owner_id = current_user.id
    if @listing.save
      render :show
    else
      render json: @listing.errors.full_messages, status: 422
    end
  end

  def destroy
    @listing = current_user.listings.find(params[:id])
    if @listing
      @listing.delete
      render :show
    else
      render json: ['Could not find listing.'], status: 404
    end
  end

  private

  def listing_params
    params.require(:listing).permit(
      :spot_id,
      :list_id
    )
  end
end
