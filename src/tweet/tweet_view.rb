class TweetView < ApplicationView
  set_java_class 'tweet.TweetFrame'
  map :view => "message.text", :model => :message
  map :view => "username.text", :model => :username
  map :view => "timeline_textbox.text", :model => :timeline
  #Monkeybar'ing around.. now to sort out the presentation...

end
