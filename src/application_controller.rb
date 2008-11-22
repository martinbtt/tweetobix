class ApplicationController < Monkeybars::Controller
  # Add content here that you want to be available to all the controllers
  # in your application  

    attr_accessor :current_user
  
  def current_user
    @current_user
  end
  
end