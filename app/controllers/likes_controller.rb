class LikesController < ApplicationController
  def create
    



    if !Like.all.where(user_id: current_user.id, post_id: params[:post_id]).empty?
      @post = Post.find(params[:post_id])
      redirect_to request.path
      return flash[:alert] = 'You already liked this post'
    else
      @like = Like.new(post_id: params[:post_id], user_id: current_user.id) 
      if @like.save
        redirect_to user_post_path(@like.post.user, @like.post)
        @like.update_likes_counter
        flash[:notice] = 'You just liked this post'
      else
        flash.now[:notice] = 'Error:Like could not be saved'
      end

    end
  end
end
