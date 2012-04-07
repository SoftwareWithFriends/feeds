class PostsController < ApplicationController

  def index
    @posts = Post.for_subscription(params[:subscription_id]).page(params[:page]).order("published_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end
end
