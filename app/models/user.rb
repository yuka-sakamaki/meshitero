class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :tweets

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  # validates :postal_code, format: { with: /\A[0-9]{3} - [0-9]{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :phone_number, format: { with: /\A\d{11}\z/ }
end
