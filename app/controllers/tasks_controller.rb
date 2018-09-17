TASKS = [ {name: "Task 1", description: "CS Fundamentals HW", completion_date: "October 4, 2018"},
          {name: "Task 2", description: "Ruby Rails - TaskList", completion_date: "October 6, 2018"},
          {name: "Task 3", description: "Personal Website", completion_date: "October 9, 2018"}]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
