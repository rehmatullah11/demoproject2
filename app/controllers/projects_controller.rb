class ProjectsController < ApplicationController
  def index
   @project=Project.all
  if current_user&.usertype == 'manager'
      @project=current_user.created_projects
    elsif current_user&.usertype == 'developer'
      @project=current_user&.assigned_projects
    elsif current_user&.usertype == 'qa'
      @project=current_user&.assigned_projects
    end
  end

  def new
    @project = Project.new
    unless can? :create, @project
      flash[:alert] = "You are not allowed to create a project"
      redirect_to root_path
    end 
  end

      
  def create
    @project = Project.new(project_params)
    @project.creator_id = current_user.id
    if @project.save
      flash[:success] = "Project was created Successfully"
      redirect_to projects_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # def show
  #   @project = Project.find(params[:id])
  # end

  def show
    @project = Project.find(params[:id])
    # authorize :read, @project
  end
  

  def edit 
  end

 
  


end

