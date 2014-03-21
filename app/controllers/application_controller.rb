class ApplicationController < ActionController::Base
	#Ensures that requests are coming from the session of the current user.
  protect_from_forgery

  #When a user authorization fails an error message will pop up.
  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, :alert => exception.message 
  end

  #Redirects the user back to the posts path after login.
  def after_sign_in_path_for(resource)
  	posts_path
  end
end
