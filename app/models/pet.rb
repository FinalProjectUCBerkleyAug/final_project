class Pet < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :pictures
  has_many :favors, dependent: :destroy
  has_many :users, through: :favors

end
