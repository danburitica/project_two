class PagesController < ApplicationController
  def home
    if user_signed_in?
      @post = current_user.posts.build
      @total_posts = Post.count
      @total_seenPosts = SeenPost.where(user_id: current_user).count
      @feed_items = Post.where.not(id: SeenPost.select("post_id").where(user_id: current_user)).paginate(page: params[:page])
      if Post.any?
        Post.where('"expirationDate" <= :current_datetime', {current_datetime: Time.zone.now}).delete_all
      end
    end
  end
  
  def profile
    @my_posts = Post.where(user_id: current_user).paginate(page: params[:page])
  end
  
  def feed
    @seen_posts = Post.left_outer_joins(:seenPosts).where(seenPosts: {user_id: current_user}).paginate(page: params[:page])
  end
end
