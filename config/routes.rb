Rideshare::Application.routes.draw do
  root :to => 'home#index'
  
  match  "locations/autocomplete_proxy" => "locations#autocomplete_proxy"
  
  resources :trips
end
