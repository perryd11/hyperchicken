require 'tweetstream'
require_relative 'seakrets'

require_relative 'rat_man'

TweetStream.configure do |config|
  config.consumer_key       = CONSUMER_KEY
  config.consumer_secret    = CONSUMER_SECRET
  config.oauth_token        = TOKEN
  config.oauth_token_secret = TOKEN_SECRET
  config.auth_method        = :oauth
end

session = RatMan.login!
TweetStream::Client.new.follow(TARGET_ID).on_timeline_status do |status|
  RatMan.follow_link!(session, $1) if status.text =~ /available (http:\/\/t.co\/\w+)/
end
