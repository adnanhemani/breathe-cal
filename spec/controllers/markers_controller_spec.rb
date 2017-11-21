require 'rails_helper'

RSpec.describe MarkersController, type: :controller do

  describe "create" do
    context "with valid attributes" do
      it "renders marker object as json" do
        post :create, {marker: {cat: true, lat: 10, lng: 10}, user_id: 1}
        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(200)
      end
    end
    
    context "while not assigned to a user " do
      it "renders nothing" do
        post :create, {marker: {cat: true, lat: 10, lng: 10}, user_id: nil}
        expect(response.body).to be_empty
      end
    end
  end
  
  describe "show" do
    
    it "renders markers as json" do
      get :show, {bounds: {uplat: 20, downlat: 10, rightlong: 20, leftlong: 10}, user_id: 1}
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(200)
    end
  end


  describe "destroy" do
    
    #method i found on the internet, haven't tested
    it "deletes the marker" do
      #expect{delete :destroy, :id => @marker}.to change(Marker, :count).by(-1)
    end
  end
end
    