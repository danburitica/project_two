class PagesController < ApplicationController
  def home
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = Post.left_outer_joins(:seenPosts).where(seenPosts: {post_id: nil}).paginate(page: params[:page])
      Post.where("expirationDate <= :current_datetime", {current_datetime: Time.zone.now}).delete_all
    end
  end
  
  def profile
    @my_posts = Post.where(user_id: current_user).paginate(page: params[:page])
  end
  
  def feed
    @seen_posts = Post.left_outer_joins(:seenPosts).where(seenPosts: {user_id: current_user}).paginate(page: params[:page])
  end
end
