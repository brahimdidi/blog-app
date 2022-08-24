class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter(post, likes_number)
    post = Post.where(id: post.id)
    post.update(likesCounter: likes_number)
  end
end
