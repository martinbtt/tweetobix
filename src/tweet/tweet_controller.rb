class TweetController < ApplicationController
  set_model 'TweetModel'
  set_view 'TweetView'
  set_close_action :exit
  
  attr_accessor :user
  
  def setup(login)
     model.login = login
     @user       = login.user
     # todo grab the timeline and populate tweets.text
  end

  
  def post_button_action_performed
    model, view_transfer = view_state
   # model.tweet
   @user.post(model.message)
  end
  

end
