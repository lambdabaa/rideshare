Rideshare::Application.routes.draw do
  root :to => 'trips#index'
  
  match  "locations/autocomplete_proxy" => "locations#autocomplete_proxy"
  
  resources :trips
  resources :rides
end
