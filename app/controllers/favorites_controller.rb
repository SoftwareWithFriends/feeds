class FavoritesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    @user.saved_posts <<  post
    @user.save
    flash[:notice] = "Post saved"
    redirect_to :back
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.saved_posts
  end

end
