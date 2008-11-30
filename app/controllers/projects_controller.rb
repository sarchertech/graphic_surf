class ProjectsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  
  # GET /projects
  def index
    @projects = Project.recent
  end

  # GET /projects/1
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.project_pictures.build
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])
    
    if @project.save
      flash[:notice] = 'Project was successfully created.'
      redirect_to(@project) 
    else
      render :action => 'new'
    end
  end

  # PUT /projects/1
  def update
    params[:project][:existing_picture_attributes] ||= {}
    
    @project = Project.find(params[:id])
    
    if @project.update_attributes(params[:project])
      flash[:notice] = "Successfully updated project."
      redirect_to(@project)
    else
      render :action => 'edit'
    end
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to(projects_url)
  end
end
