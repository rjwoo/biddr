require 'rails_helper'

RSpec.describe AuctionController, type: :controller do
  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "initiates a new auction instance variable" do
      get :new
      expect(assigns(:auction)).to be_a_new(Auction)
    end
  end

  describe "#create" do
    context "with valid attributes" do
      def valid_request
        post :create, auction: FactoryGirl.attributes_for(:auction)
      end

      it "saves a record to the database" do
        count_before = Auction.count
        valid_request
        count_after = Auction.count
        expect(count_after).to eq(count_before + 1)
      end

      it "redirects to the show page of the auction" do
        valid_request
        expect(response).to redirect_to(auction_path(Auction.last))
      end
    end
  end
end
