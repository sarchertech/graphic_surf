class CommentsController < ApplicationController
  before_filter :authenticate, :except => :create
  
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.find(:all, :order => 'created_at DESC', :limit => 200 )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    
    @comment.name = 'Anonymous' if @comment.name.blank?
    
    unless @comment.content.blank?
      render :file => "#{RAILS_ROOT}/public/400.html", :status => 400 and return
    else
      if @comment.spam? 
        render :file => "#{RAILS_ROOT}/public/spam.html", :status => 400 and return
      else
        @comment.body.gsub!(/\n/,"<br />")
        @comment.save
        expire_page :controller => 'blog', :action => 'index'
        redirect_to :controller => 'blog', :action => 'show', :id => @comment.post_id
      end  
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        expire_page :controller => 'blog', :action => 'index'
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    expire_page :controller => 'blog', :action => 'index'
    
    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
