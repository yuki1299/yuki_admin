class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy, :change]

  def index
    @tasks = @project.tasks
  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(task_params)

    if @task.save
      redirect_to new_project_ask_path(@project), notice: "Tarefas criadas com sucesso"
    else
      redirect_to new_project_task_path(@project), alert: "Não foi possível cadastrar as tarefas"
    end
  end

  def edit
  end

  def update
    if @task.update_attribute(task_params)
      redirect_to project_tasks_path(@project), notice: "Tarefa atualizada com sucesso"
    else
      redirect_to project_tasks_path(@project), alert: "Não foi possível atualizar as tarefas" 
    end
  end

  def destroy
    if @task.destroy
      redirect_to project_tasks_path(@project), notice: "Tarefa apagada com sucesso"
    else
      redirect_to project_tasks_path(@project), alert: "Não foi possível apagar sua tarefa"
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:objective, :url, :cenary)
  end
end