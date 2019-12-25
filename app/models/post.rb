class Post < ApplicationRecord
  scope :timeline, ->(user) { where(user: user) }
  belongs_to :user
#  mount_uploader :video, VideoUploader
end
