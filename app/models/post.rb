class Post < ApplicationRecord
  has_many :comments
#  mount_uploader :video, VideoUploader

end
