class AuctionController < ApplicationController

  def new
    @auction = Auction.new
  end

  def create
    auction_params = params.require(:auction).permit(:title, :details, :ends_on, :reserve_price)
    @auction = Auction.new auction_params
    @auction.save
    redirect_to auction_path(@auction)
  end

end
