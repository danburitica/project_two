class Post < ApplicationRecord
  belongs_to :user
  has_many :seenPosts, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :expirationDate, presence: true
end
