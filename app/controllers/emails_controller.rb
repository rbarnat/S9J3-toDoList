class EmailsController < ApplicationController
  require 'faker'

  def index
    @emails = Email.all.sort { |x, y| x.created_at <=> y.created_at }
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)

    respond_to do |format|
      format.html do 
        #code en cas de requête classique 
      end
      format.js do
        #code en cas de requête AJAX
      end
    end
  end

  def new

  end

  def create
    @email = Email.new( object: Faker::Book.title,
                        body: Faker::Lorem.paragraph,
                        read: false)

    if @email.save
      flash[:notice] = "Email received"
    else
      flash[:notice] = "Please try again"
    end

    respond_to do |format|
      format.html do 
        #code en cas de requête classique 
        redirect_to root_path
      end
      format.js do
        #code en cas de requête AJAX
      end
    end
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    puts params
    @email = Email.find(params[:id])
    @email.update(task_params)
    puts task_params
    puts @email.read

    respond_to do |format|
      format.html do 
        #code en cas de requête classique 
        redirect_to root_path
        flash[:notice] = "Email edited"
      end
      format.js do
        #code en cas de requête AJAX
      end
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    
    respond_to do |format|
      format.html do 
        #code en cas de requête classique 
        flash[:notice] = "Email destroyed"
        redirect_to root_path
      end
      format.js do
        #code en cas de requête AJAX
      end
    end
  end

  private
  
  def task_params
    params.permit(:id, :object, :body, :read)
  end
end
