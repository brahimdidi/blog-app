class Post < ApplicationRecord
  belongs_to :user

  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, :likesCounter, numericality: { greater_than: -1, allow_nil: true }
  def increment_posts_counter
    user.increment!(:postsCounter)
  end

  def deccrement_posts_counter
    user.deccrement!(:postsCounter)
  end

  def already_liked?(user)
    likes.exists?(user_id: user.id)
  end

  def last_5_comments
    comments.limit(5).order(created_at: :desc)
  end

  def get_time_ago
    @post_time_ago = ((created_at - DateTime.now) / 3600 ).abs; 
    @time_name = 'hours';
    if( @post_time_ago * 60 ) < 1 
       @post_time_ago = @post_time_ago * 3600; @time_name = 'seconds'
    elsif @post_time_ago < 1 
       @post_time_ago = @post_time_ago * 60; @time_name = 'minutes'
    elsif @post_time_ago.between?(25,720) 
       @post_time_ago =  @post_time_ago / 24; @time_name = 'days'
    elsif @post_time_ago.between?(721,8640) 
       @post_time_ago =  @post_time_ago / 720; @time_name = 'months'
    elsif @post_time_ago > 8640 
       @post_time_ago =  @post_time_ago / 8640 ; @time_name = 'years'
    end

    if @post_time_ago.floor <= 1 
      @time_name = @time_name.chop
       if @time_name == 'second' 
         @time_name = 'just now'
      end
    end

     unless  @time_name == 'just now' 
     @time_name = @time_name + ' ago' 
    end
    return {post_time_ago: @post_time_ago, time_name: @time_name}
  end
end
