class TasksController < ApplicationController

  before_filter :find_task, only: %w(show destroy update)

  def index
    @tasks = Task.all
    render json: @tasks
  end

  def show
    render json: @task
  end

  def update
    if @task.update(permitted_task_attributes)
      render json: @task, status: 200
    else
      render json: @task, status: 422
    end
  end

  def create
    @task = Task.new(permitted_task_attributes)

    if @task.save
      render json: @task, status: 200
    else
      render json: { error: "Task is invalid" }, status: 422
    end
  end

  def destroy
    if @task.destroy
      render json: @task, status: 200
    else
      render json: @task, status: 422
    end
  end

  def spent_times
    @tasks = Task.all
    render json: @tasks, each_serializer: SpentTimeSerializer
  end

  protected

    def find_task
      @task = Task.find_by_id(params[:id])
    end

    def permitted_task_attributes
      params.require(:task).permit(:title)
    end

end