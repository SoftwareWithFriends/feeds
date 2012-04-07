class PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).order("published_at DESC").all
  end

  def show
    @post = Post.find(params[:id])
  end
end
