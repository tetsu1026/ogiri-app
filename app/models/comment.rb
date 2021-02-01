class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, dependent: :destroy

  validates :message, presence: true
end
