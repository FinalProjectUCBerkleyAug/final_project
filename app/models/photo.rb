class Photo < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :post
  belongs_to :user
end