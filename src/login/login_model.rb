class LoginModel
  attr_accessor :username, :password, :message, :errors, :user

  
  def login(username, password)
    begin
      @user = Twitter::Base.new(username, password)
      @user.timeline
      self
    rescue  Twitter::CantConnect => e
      @errors ||= []
      @errors << e.message
      return false
    end
    
  end
    
end
