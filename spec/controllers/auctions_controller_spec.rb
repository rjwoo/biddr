require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  let (:auction){FactoryGirl.create(:auction)}

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

      it "redirects to the index page" do
        valid_request
        expect(response).to redirect_to(auction_path(Auction.last))
      end
    end

    context "with invalid attributes" do
      def invalid_request
        post :create, auction: {title: ""}
      end

      it "renders the new template" do
        invalid_request
        expect(response).to render_template(:new)
      end
    end
  end

end
