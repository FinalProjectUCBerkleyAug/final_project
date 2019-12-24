class Post < ApplicationRecord
#  mount_uploader :video, VideoUploader
  belongs_to :pet
end
