class Post < ApplicationRecord

  self.per_page = 10
  has_many :comments
  has_many :likes
  belongs_to :user

end
