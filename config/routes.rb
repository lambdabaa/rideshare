Rideshare::Application.routes.draw do
  root :to => 'home#index'
  
  resources :trips
end
