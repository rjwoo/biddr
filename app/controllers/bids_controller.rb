class BidsController < ApplicationController
  before_action :find_bids, only: [:edit, :show, :update]

  def new
    @bid = Bid.new
  end

  def create
    bid_params = params.require(:bid).permit(:bid_price)
    @bid = Bid.new bid_params
    @auction = Auction.find params[:auction_id]
    @bid.auction = @auction
    respond_to do |format|
      if @bid.save
        format.html { redirect_to auction_path(@auction) }
        format.js { render :create_success }
      else
        format.html { render "auctions/show" }
        format.js { render :create_failure }
      end
    end
  end

  def index
    @bids = Bid.all
  end

  def show
  end

  def edit
  end

  def update
    bid_params = params.require(:bid).permit(:bid_price)
    if @bid.update bid_params
      redirect_to bid_path(@bid)
    else
      render :edit
    end
  end

  private

  def find_bid
    @bid = Bid.find params[:id]
  end
end
