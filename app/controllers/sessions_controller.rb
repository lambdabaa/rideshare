class SessionsController < ApplicationController
  def create
    	auth = request.env["omniauth.auth"] 

      if User.find_by_provider_and_uid(auth["provider"], auth["uid"])
        user = User.update_with_omniauth(auth)
    	else 
    	  user = User.create_with_omniauth(auth)
    	end

   		session[:user_id] = user.id
    	redirect_to Rails.cache.read("return_url"), :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
