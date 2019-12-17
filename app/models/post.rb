class Post < ApplicationRecord
  scope :timeline, ->(user) { where(user: user) }
  has_many :comments
  has_many :likes
  belongs_to :user

end
