class Post < ApplicationRecord
  scope :timeline, ->(user) { where(user: user) }
  has_many :comments
  belongs_to :user
  belongs_to :pet
  has_many :likes, dependent: :destroy
  has_many :users, through: :comments
  has_many :users, through: :likes

end
