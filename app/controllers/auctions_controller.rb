class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
  end

  def create
    auction_params = params.require(:auction).permit(:title, :details, :end_date, :reserve_price)
    @auction = Auction.new auction_params
    if @auction.save
      redirect_to auctions_path, notice: "Bid Created!"
    else
      render :new
    end
  end

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find params[:id]
    @bid = Bid.new
  end

  def update
  end

  def edit
  end

end
