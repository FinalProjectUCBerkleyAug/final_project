class Post < ApplicationRecord
  scope :timeline, ->(user) { where(user: user) }
  has_many :comments
  belongs_to :user
  belongs_to :pet
  has_many :likes, as: :likeable

end
