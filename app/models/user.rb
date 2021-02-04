class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :post_likes
  has_one_attached :image

  with_options presence: true do
    validates :nickname
    validates :profile
  end

end
