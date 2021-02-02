class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :post_likes, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre


   validates :sentence, presence: true
   validates :genre_id, numericality: { other_than: 1, message: 'Select'}

  with_options length: {maximum:50} do
     validates :sentence, presence: true
     validates :title, presence: true, unless: :was_attached?
  end
  
   def was_attached?
    self.image.attached?
   end
 

end