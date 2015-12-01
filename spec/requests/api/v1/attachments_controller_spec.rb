require 'rails_helper'

describe Api::V1::AttachmentsController do

  describe "GET #show" do
    it "returns an attachment" do
      attachment = FactoryGirl.create(:attachment)

      get "/v1/listings/#{attachment.listing.id}/attachments/#{attachment.id}"

      expect(response).to be_success
      expect(json["file_id"]).not_to be(nil)
    end
  end

end
