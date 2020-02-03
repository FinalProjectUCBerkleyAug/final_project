class Post < ApplicationRecord
  scope :timeline, ->(user) { where(user: user) }
  mount_uploader :picture, PictureUploader
  
  has_many :comments
  has_many :pictures
  belongs_to :user
  belongs_to :pet
  has_many :likes, dependent: :destroy
  has_many :users, through: :comments
  has_many :users, through: :likes

end
