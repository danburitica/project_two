class SeenPostController < ApplicationController
  def mark
   SeenPost.create(post: Post.find(params[:post]), user: current_user)
   @mark_seen = true
  end
end