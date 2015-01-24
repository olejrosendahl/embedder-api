require 'rails_helper'

describe Api::V1::ListingsController do

  describe "GET #show" do
    it "returns a listing" do
      listing = FactoryGirl.create(:listing)
      listing.save!

      get "/v1/listings/#{listing.id}"

      expect(response).to be_success
      expect(json["name"]).to eq(listing.name)
    end
  end

  describe "POST #create" do
    it "creates as listing" do
      post "/v1/listings", {listing: FactoryGirl.attributes_for(:listing)}

      expect(response).to  be_success
      expect(Listing.first.name).to eq("My listing")
    end
  end

  describe "GET #index" do
    it "returns a list of all listings" do
      FactoryGirl.create_list(:listing, 5)

      get "/v1/listings"

      expect(response).to be_success
      expect(json['listings'].length).to be(5)
    end
  end

  describe "DELETE #destroy" do
    it "deletes a listing" do
      listing = FactoryGirl.create(:listing)

      delete "/v1/listings/#{listing.id}"

      expect(response).to be_success
      expect(Listing.all).to be_empty
    end
  end

  describe "PATCH #update" do
    it "updates a listing" do
      listing = FactoryGirl.create(:listing)

      patch "/v1/listings/#{listing.id}", {listing: {name: "New Name"}}

      expect(response).to be_success
      expect(listing.reload.name).to eq("New Name")
    end
  end

end
