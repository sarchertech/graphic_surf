class PostsController < ApplicationController
  before_filter :authenticate
  
  # GET /posts
  def index
    @posts = Post.find(:all)
  end
  
  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  end
  
  # GET /posts/new
  def new
    @post = Post.new
    @post.post_pictures.build
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])
    
    if @post.save
      flash[:notice] = 'post was successfully created.'
      redirect_to(@post) 
    else
      render :action => 'new'
    end
  end

  # PUT /posts/1
  def update
    params[:post][:existing_picture_attributes] ||= {}
    
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to(@post)
    else
      render :action => 'edit'
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to(posts_url)
  end
  
  def publish
    @post = Post.find(params[:id])
    @post.published = true
    @post.save
    
    redirect_to(@post)
  end  
end
