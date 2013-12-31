require 'tweetstream'
require_relative 'seakrets'

TweetStream.configure do |config|
  config.consumer_key       = CONSUMER_KEY
  config.consumer_secret    = CONSUMER_SECRET
  config.oauth_token        = TOKEN
  config.oauth_token_secret = TOKEN_SECRET
  config.auth_method        = :oauth
end

jonesdeini = 266248662

TweetStream::Client.new.follow(jonesdeini) do |status|
  puts "#{status.text}"
end
