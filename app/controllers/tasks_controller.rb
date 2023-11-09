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

    if @task.save
      redirect_to tasks_path, notice: "Success"
    else
      render :error
    end
  end

  def destroy
    task = Task.find(params[:id])
    task&.destroy
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])
    render :error unless @task.update(task_params)
  end

  private
  def task_params
    params.require(:task).permit(:title)
  end
end
