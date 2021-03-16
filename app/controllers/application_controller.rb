class ApplicationController < ActionController::Base
  include Pundit 
  protect_from_forgery with: :exception
  
  private
  
    def after_sign_in_path_for(resource)
      welcome_message(resource)
      stored_location_for(resource)
    end
  
    def after_sign_up_path_for(resource)
      welcome_message(resource)
      stored_location_for(resource)
    end
  
    def welcome_message(resource)
      flash[:notice] = "Hello #{resource.email}! Glad to welcome you here!"
    end
end
