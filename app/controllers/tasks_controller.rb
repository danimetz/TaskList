
class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:due_date)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
     render :notfound, status: :not_found
    end
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], due_date: params[:task][:due_date]) #instantiate a new book
    if @task.save # save returns true if the database insert succeeds
      redirect_to root_path # go to the index so we can see the book in the list
    else # save failed :(
      render :new # show the new book form view again
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id].to_i)

  end

  def update
    @task = Task.find(params[:id].to_i)
    @task.name = params[:task][:name]
    @task.description = params[:task][:description]
    @task.due_date = params[:task][:due_date]

    @task.save # save returns true if the database insert succeeds
    redirect_to task_path # go to the index so we can see the book in the list
  end

  def destroy
    @task = Task.find(params[:id].to_i)
    @task.destroy

    redirect_to root_path
  end

end
