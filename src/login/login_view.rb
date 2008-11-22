class LoginView < ApplicationView
  set_java_class 'login.LoginFrame'
  map :view => "username.text", :model => :username
  map :view => "password.text", :model => :password

  
  define_signal :name => :login_failed, :handler => :login_failed

  def login_failed(model, transfer)
    message.text = transfer[:errors].to_s
  end
  
end
