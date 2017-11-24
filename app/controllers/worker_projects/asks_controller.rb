class WorkerProjects::AsksController < ApplicationController
  include ProjectsHelper

  def index
    @project = Project.find(params[:id])
    @asks = @project.asks
    @tasks = @project.tasks
    @tester = current_tester
  end

  def answer
    @project = Project.find(params[:project_id])
    @ask = Ask.find(params[:id])
    @answer = @ask.answers.new
  end

  def answer_create
    @project = Project.find(params[:project_id])
    @ask = Ask.find(params[:id])
    @answer = @ask.answers.new(answers_params)
    set_tester

    if @answer.save
      redirect_to worker_projects_tasks_path(@project), notice: "Perguntas criadas com sucesso"
    else
      redirect_to new_project_ask_path(@project), alert: "Não foi possível cadastrar as perguntas"
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
