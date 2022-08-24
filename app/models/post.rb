class Post < ApplicationRecord
  belongs_to :user

  has_many :likes
  has_many :comments
  def update_user_posts_counter(user,posts_number)
    user = self.where(id: user.id)
    user.update(PostsCounter: posts_number)
  end
end
