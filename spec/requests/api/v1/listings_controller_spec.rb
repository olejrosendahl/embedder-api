require 'rails_helper'
require 'benchmark'

describe Api::V1::ListingsController do

  describe "GET #show" do
    it "returns a listing" do
      listing = FactoryGirl.create(:listing)

      get "/v1/listings/#{listing.id}"

      expect(response).to be_success
      expect(json['id']).to eq(listing.id);
      expect(json["name"]).to eq(listing.name)
      expect(json['content']).to eq(listing.content)
      expect(json['created_at']).to eq(listing.created_at.as_json)
    end

    it "returns 404 on non-existing listings" do
      get "/v1/listings/9999"
      expect(response).to be_not_found
    end
  end

  describe "POST #create" do
    it "creates as listing" do
      listing_attributes = FactoryGirl.attributes_for(:listing)

      post "/v1/listings", { listing: listing_attributes }

      expect(response).to  be_success
      expect(Listing.first.name).to eq(listing_attributes[:name])
      expect(Listing.first.content).to eq(listing_attributes[:content])
    end
  end

  describe "GET #index" do
    it "returns a list of all listings" do
      FactoryGirl.create_list(:listing, 5)

      get "/v1/listings"

      expect(response).to be_success
      expect(json['listings'].length).to be(5)
    end

    it "is fast" do
      FactoryGirl.create_list(:listing, 5)
      expect(Benchmark.realtime do
        5.times { get "/v1/listings" }
      end).to be < 0.6
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

    it "returns 404 on-non existing listing" do
      patch "/v1/listings/9999"
      expect(response).to be_not_found
    end
  end
end
