class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter(post, comments_number)
    post = Post.where(id: post.id)
    post.update(commentsCounter: comments_number)
  end
end
