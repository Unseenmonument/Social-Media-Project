class Tag < ApplicationRecord
    
    has_many :tweet_tags
    has_many :tags, through: :tweets_tags

end
