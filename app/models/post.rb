class Post < ApplicationRecord
  scope :timeline, ->(user) { where(user: user) }

  belongs_to :user
end
