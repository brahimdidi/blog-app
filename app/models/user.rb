class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes
  
  
  validates :name, presence: true
  validates :postsCounter, numericality: { greater_than: -1, allow_nil: true } 

  def last_3_posts
    posts.order(created_at: :desc).limit(3)
  end
end
