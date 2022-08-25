class Post < ApplicationRecord
  belongs_to :user

  has_many :likes
  has_many :comments
  def increment_posts_counter
    user.increment!(:postsCounter)
  end

  def last_5_comments
    comments.limit(5).order(created_at: :desc)
  end
end
