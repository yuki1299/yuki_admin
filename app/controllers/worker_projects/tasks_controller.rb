class WorkerProjects::TasksController < ApplicationController
  include ProjectsHelper

  def index
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @asks = @project.asks
    @tester = current_tester
  end

  def finish_test
    @project = Project.find(params[:id])
    @project.to_progress if @project.status != "in_progress"
    @project.number_answers = @project.number_answers + 1
    if @project.save
      redirect_to worker_projects_path, notice: "Resposta enviada com sucesso"
    else
      redirect_to worker_projects_tasks(project), notice: "Sua resposta não pode ser enviada"
    end
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
      redirect_to worker_projects_tasks_path(@project), notice: "Perguntas criadas com sucesso"
    else
      redirect_to worker_projects_tasks_opened_path(@project, @task), alert: "Não foi possível cadastrar as perguntas"
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
