class LoginController < ApplicationController
  set_model 'LoginModel'
  set_view 'LoginView'
  set_close_action :exit

  def login_button_action_performed
    model, view_transfer = view_state
    
    if  @user = model.login(model.username, model.password)
      TweetController.instance.setup(model)
      TweetController.instance.open   
      close
    else
      transfer[:errors] = model.errors
      signal(:login_failed) 
    end
    

  end
end
