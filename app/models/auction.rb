class Auction < ActiveRecord::Base
  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :details, presence: true
  validates :end_date, presence: true
  validates :reserve_price, presence: true
end
