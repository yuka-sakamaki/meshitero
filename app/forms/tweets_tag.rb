class TweetsTag

  include ActiveModel::Model
  attr_accessor :message, :name, :image

  with_options presence: true do
    validates :message
    validates :name
    validates :image
  end

  def save
    tweet = Tweet.create(message: message, image: image)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end

  def find
    tweet = Tweet.find(params[:id])
    tag = Tag.find(params[:id])
  end

end