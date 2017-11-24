class WorkerProjects::TasksController < ApplicationController
  include ProjectsHelper

  def index
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @tester = current_tester
  end

  def show
  end

  def new
    @ask = @project.asks.new
  end

  def answer
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @answer = @task.answers.new
  end

  def answer_create
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @answer = @task.answers.new(answers_params)
    set_tester

    if @answer.save
      redirect_to worker_projects_tasks_opened_path(@project), notice: "Perguntas criadas com sucesso"
    else
      redirect_to new_project_ask_path(@project), alert: "Não foi possível cadastrar as perguntas"
    end
  end

  def edit
  end

  def update
    if @ask.update_attributes(ask_params)
      redirect_to project_asks_path(@project), notice: "Perguta atualizada com sucesso"
    else
      redirect_to project_asks_path(@project), alert: "Não foi possível atualizar as perguntas"
    end
  end

  def destroy
    if @ask.destroy
      redirect_to project_asks_path(@project), notice: "Perguta apagada com sucesso"
    else
      redirect_to project_asks_path(@project), alert: "Não foi possível apagar sua pergunta"
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

    def answers_params
    params.require(:answer).permit!
  end

  def set_tester
    @answer.tester = current_tester
  end
end
