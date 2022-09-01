class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:post_id], user_id: current_user.id)
    if @like.save
      redirect_to user_posts_path(current_user)
      @like.update_likes_counter
    else
      flash.now[:error] = 'Error:Post could not be saved'
    end
  end
end
