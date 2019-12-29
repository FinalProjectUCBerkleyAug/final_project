class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
#  mount_uploader :video, VideoUploader
  belongs_to :pet

end
