Rideshare::Application.routes.draw do
  root :to => 'home#index'
  
   match "/auth/:provider/callback" => "sessions#create"
   match "/signout" => "sessions#destroy", :as => :signout
   
   # TODO{bayers}: create route for callbackerror if user hits cancel after login button 
   # match "/auth/:provider/error" => "sessions#failure"
  
  resources :trips
end