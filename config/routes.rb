Rideshare::Application.routes.draw do
  root :to => 'home#index'
  
   match "/auth/:provider/callback" => "sessions#create"
   match "/signout" => "sessions#destroy", :as => :signout
  
  resources :trips
end