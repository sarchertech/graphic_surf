class BlogController < ApplicationController
  def index
    @post = Post.published.last
    @posts = Post.published.recent
    @comment = Comment.new
  end
  
  def show
    @post = Post.published.find(params[:id])
    @posts = Post.published.recent
    @comment = Comment.new
    render :action => 'index'
  end
end
