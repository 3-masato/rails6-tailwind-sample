class TasksController < ApplicationController
  def edit
    @task = Task.find(params[:id])
  end

  def show
  end

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @tasks = Task.all

    if @task.save
      redirect_to tasks_path, notice: "Success"
    else
      render :index
    end
  end

  def destroy
    task = Task.find(params[:id])
    task&.destroy
    redirect_to tasks_path
  end

  def update
  end

  private
  def task_params
    params.require(:task).permit(:title)
  end
end
