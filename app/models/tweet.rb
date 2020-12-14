class Tweet < ApplicationRecord

  has_many :tweet_tag_relations, dependent: :destroy
  has_many :tags, through: :tweet_tag_relations
  has_one_attached :image
  belongs_to :user
  has_many :comments

  after_create do
    tweet = Tweet.find_by(id: id)
    tags = hashname.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(name: tag.downcase.delete('#'))
      tweet.tags << tag
    end
  end

  before_update do
    tweet = Tweet.find_by(id: id)
    tags = hashname.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(name: tag.downcase.delete('#'))
      tweet.tags << tag
    end
  end

end
