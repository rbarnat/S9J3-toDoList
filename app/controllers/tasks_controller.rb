class TasksController < ApplicationController
  before_action :authenticate_user!
    def new
      @categories = Category.all
    end
  
    def create
      @task = Task.new(task_params)
      @category = Category.find(category_params)
      @task.category = @category
  
      respond_to do |format|
        format.html do 
          #code en cas de requête classique 
          if @task.save
            flash[:notice] = "Task created"
          else
            flash[:notice] = "Please try again"
          end
          redirect_to root_path
        end
        format.js do
          #code en cas de requête AJAX
        end
      end
    end
  
    def edit
      @task = Task.find(params[:id])
      @categories = Category.all
  
    end
  
    def update
      @task = Task.find(params[:id])
      @task.update(task_params)

      respond_to do |format|
        format.html do 
          #code en cas de requête classique 
          redirect_to root_path
          flash[:notice] = "Task edited"
        end
        format.js do
          #code en cas de requête AJAX
        end
      end
    end
  
    def index
      @tasks = Task.all
    end
  
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      
      respond_to do |format|
        format.html do 
          #code en cas de requête classique 
          flash[:notice] = "Task destroyed"
          redirect_to root_path
        end
        format.js do
          #code en cas de requête AJAX
        end
      end
    end
  
  
    private
  
    def task_params
      params.permit(:title, :deadline, :description, :status)
    end
  
    def category_params
      params.require(:Category)
    end
  
  end
  