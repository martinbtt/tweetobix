class TweetModel

  attr_accessor :message
  attr_accessor :user
  attr_accessor :username
  attr_accessor :timeline

  
  def login=(login)
     @username = login.username
     @user     = login.user
     @timeline = @user.timeline.collect{|t| [t.user.name, t.text].join(': ')}.join("\n\n")
  end
  

  
  def tweet
    @user.post(@message)
  end
  
end
