class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def last_3_posts(user)
    user = self.where(id: user.id)
    user.posts.limit(3).order(created_at: :desc)

  end
end
