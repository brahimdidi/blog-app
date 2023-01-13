class LikesController < ApplicationController
  def create
    if !Like.all.where(user_id: current_user.id, post_id: params[:post_id]).empty?
      like = Like.all.where(user_id: current_user.id, post_id: params[:post_id]).first;
      like.destroy
      like.decrement_likes_counter
      redirect_to request.path
      flash[:alert] = 'post was unliked'
    else
      @like = Like.new(post_id: params[:post_id], user_id: current_user.id) 
      if @like.save
        redirect_to request.path
        @like.increment_likes_counter
        flash[:notice] = 'You just liked this post'
      else
        flash.now[:notice] = 'Error:Like could not be saved'
      end
    end
  end
end
