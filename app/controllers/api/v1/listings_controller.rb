class Api::V1::ListingsController < ApplicationController

  def index
    @listings = Listing.all
    render json: {listings: @listings}
  end

  def show
    @listing = Listing.find(params[:id])
    render json: @listing
  end

  def create
    @listing = Listing.create(permitted_params[:listing])
    render json: @listing
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy!
    render json: @listing
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(permitted_params[:listing])
    render json: @listing
  end

  private

  def permitted_params
    params.permit(listing: [:name])
  end

end
