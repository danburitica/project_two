class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def create
    @post = current_user.posts.build(post_params) 
    if @post.save
      flash[:notice] = "Post Created!"
      redirect_to root_url
    else
      @feed_items = Post.left_outer_joins(:seenPosts).where(seenPosts: {post_id: nil}).paginate(page: params[:page])
      render 'pages/home'
    end

  end
  
  def destroy
    @post.destroy
    flash[:alert] = "Post deleted"
    if request.referrer.nil? || request.referrer == posts_url
      redirect_to root_url
    else
      redirect_to request.referrer
    end
  end
  
  private
  
  def post_params 
    params.require(:post).permit(:content, :expirationDate)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
