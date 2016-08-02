Rails.application.routes.draw do

  root "auction#new"

  resources :auctions do
    resources :bids
  end

end
