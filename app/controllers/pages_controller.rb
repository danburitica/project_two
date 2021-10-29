class PagesController < ApplicationController
  def home
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = Post.all.paginate(page: params[:page])
    end
  end
  
  def profile
  end
  
  def feed
  end
end
