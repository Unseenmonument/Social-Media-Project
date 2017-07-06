module TweetsHelper
    
def get_tagged(tweet)
    
    message_arr = []
    
    message_arr = tweet.message.split
    
    message_arr.each do |word|
      if word[0] ="#"
        if Tag.pluck(:phrase).include?(word)
          tag = Tag.find_by(phrase: word)
        
        else
          tag = Tag.create(phrase: word)
        end
        tweet_tag = TweetTag.create(tweet_id: tweetid, tag_id: tag.id)
        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
      end
    end
    
    tweet.message = message_arr.join(" ")
    
    return tweet
end


end
