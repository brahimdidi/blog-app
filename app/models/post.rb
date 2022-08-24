class Post < ApplicationRecord
  belongs_to :user

  has_many :likes
  has_many :comments
  def update_user_posts_counter(user,posts_number)
    user = User.where(id: user.id)
    user.update(PostsCounter: posts_number)
  end
  def last_5_comments(post)
    post = self.where(id: post.id)
    recent_comments = post.comments.limit(5).order(created_at: :desc)
  end
end
