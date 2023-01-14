class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def increment_likes_counter
    post.increment!(:likesCounter)
  end

  def decrement_likes_counter
    post.decrement!(:likesCounter)
  end
end
