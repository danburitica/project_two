class SeenPostController < ApplicationController
  def mark
    SeenPost.create(post: Post.find(params[:post]), user: current_user)
    flash[:success] = "Mark as Seen!"
    redirect_to root_url
  end
end