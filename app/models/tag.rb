class Tag < ApplicationRecord

  has_many :tweet_tag_relations, dependent: :destroy
  has_many :tweets, through: :tweet_tag_relations

  validates :name, uniqueness: true, length: {maximum: 30}
end
