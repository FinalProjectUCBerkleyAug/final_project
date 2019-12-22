class Post < ApplicationRecord
  mount_uploader :video, VideoUploader
end
