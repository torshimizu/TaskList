class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    raw_task = params[:task]
    task = Task.new
    task.name = raw_task[:name]
    task.description = raw_task[:description]
    task.priority = raw_task[:priority]
    task.completion_date = raw_task[:completion_date]

    if task.save
      redirect_to '/task'
    end
  end

  def show
    task_id = params[:id]

    @task = Task.find(task_id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    raw_task = params[:task]
    task.name = raw_task[:name]
    task.description = raw_task[:description]
    task.priority = raw_task[:priority]
    task.completion_date = raw_task[:completion_date]

    if task.save
      redirect_to '/tasks'
    end
  end

  def destroy
  end
end
