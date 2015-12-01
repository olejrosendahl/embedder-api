class Api::V1::AttachmentsController < ApplicationController

  private

  def permitted_params
    params.permit(attachment: [:file])
  end

end
