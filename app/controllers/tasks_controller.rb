
class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:due_date , status: :desc)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
     render :notfound, status: :not_found
    end
  end

  def create
    @task = Task.new(task_params) #instantiate a new book
    @task.status = "Incomplete"
    if @task.save # save returns true if the database insert succeeds
      redirect_to root_path # go to the index so we can see the book in the list
    else # save failed :(
      render :new # show the new book form view again
    end
  end

  def new
    @task = Task.new(status: "Incomplete")
  end

  def edit
    @task = Task.find(params[:id].to_i)

  end

  def update
    @task = Task.find(params[:id].to_i)
    @task.update(task_params)
    @task.save # save returns true if the database insert succeeds
    redirect_to task_path # go to the index so we can see the book in the list
  end

  def destroy
    @task = Task.find(params[:id].to_i)
    @task.destroy

    redirect_to root_path
  end

  def complete
    @task = Task.find(params[:id].to_i)
    if @task.completion_date == nil
      @task.status = "Complete"
      @task.completion_date = Date.today
    else
      @task.status = "Incomplete"
      @task.completion_date = nil
    end
    @task.save
    redirect_to root_path
  end

  private

  def task_params
    return params.require(:task).permit(:name, :description, :due_date)
  end


end
