class Post < ApplicationRecord
  belongs_to :user

  has_many :likes
  has_many :comments
  def update_user_posts_counter(user,likes_number)
    user = self.where(id: user.id)
    user.update(PostsCounter: likes_number)
  end
end
