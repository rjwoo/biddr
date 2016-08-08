class AuctionsController < ApplicationController
  before_action :find_auction, only: [:show, :update, :destroy]
  before_action :auction_params, only: [:create, :update]

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    if @auction.save
      redirect_to auction_path(@auction), notice: "Bid Created!"
    else
      render :new
    end
  end

  def index
    @auctions = Auction.all
  end

  def show
    @bid = Bid.new
  end

  def update
    if @auction.update auction_params
      redirect_to auction_path(@auction), notice: "Auction Updated!"
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @auction.destroy
    redirect_to auctions_path
  end

  private

  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:title, :details, :end_date, :reserve_price)
  end

end
