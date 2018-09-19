
class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:completion_date)
  end

  def show
    id = params[:id]
    @task = Task.find_by(id: id)

    if @task.nil?
     render :notfound, status: :not_found
    end

end
