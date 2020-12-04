class TweetsTag

  include ActiveModel::Model
  attr_accessor :message, :name, :image, :tag_id, :tweet_id

  with_options presence: true do
    validates :message
    validates :name
    validates :image
  end

  def save
    tweet = Tweet.create(message: message, image: image)
    tag_list = Tag.where(name: name).first_or_initialize
    tag_list.save

    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end

end