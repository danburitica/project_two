class PagesController < ApplicationController
  def home
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = Post.left_outer_joins(:seenPosts).where(seenPosts: {post_id: nil}).paginate(page: params[:page])
      # Post.where("expirationDate < ?", Time.zone.now).delete_all
    end
  end
  
  def profile
  end
  
  def feed
  end
end
