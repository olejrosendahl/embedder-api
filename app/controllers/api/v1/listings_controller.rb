class Api::V1::ListingsController < ApplicationController

  private

  def permitted_params
    params.permit(listing: [:name, :content])
  end

end
