class TasksController < ApplicationController
  def edit
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @tasks = Task.all

    render :error_create unless @task.save
  end

  def destroy
    task = Task.find(params[:id])
    task&.destroy
    @tasks = Task.all
  end

  def update
    @task = Task.find(params[:id])
    render :error_update unless @task.update(task_params)
  end

  private
  def task_params
    params.require(:task).permit(:title)
  end
end
