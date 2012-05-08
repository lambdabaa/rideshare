Rideshare::Application.routes.draw do
  root :to => 'trips#index'
  resources :trips
  
  match  'locations/autocomplete_proxy' => 'locations#autocomplete_proxy'
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout
end
