class Post < ApplicationRecord
  belongs_to :user

  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 10 }
  validates :commentsCounter, :likesCounter, numericality: { greater_than: -1, allow_nil: true }
  def increment_posts_counter
    user.increment!(:postsCounter)
  end

  def last_5_comments
    comments.limit(5).order(created_at: :desc)
  end
end
