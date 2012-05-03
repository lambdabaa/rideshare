Rideshare::Application.routes.draw do
  root :to => 'trips#index'
  
  resources :trips
  resources :rides
end
