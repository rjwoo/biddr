class BidsController < ApplicationController

  def new
    @auction = Auction.find params[:auction_id]
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

end
