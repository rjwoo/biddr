Rails.application.routes.draw do

  root "auction#new"

  resources :auction

end
