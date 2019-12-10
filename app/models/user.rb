class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :comments
<<<<<<< HEAD
  has_many :posts
=======
>>>>>>> 1ce77cb02584a18612900c53c47d793f3f0007a4
end
