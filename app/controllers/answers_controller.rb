class WorkerProjects::AnswersController < ApplicationController
  before_action :set_project
  before_action :set_ask, only: [:show, :edit, :update, :destroy, :change]

  def index
    @tasks = @project.tasks
  end

  def show
  end

  def new
    @ask = @project.asks.new
  end

  def create
    @ask = @project.asks.new(answers_params)

    if @ask.save
      redirect_to project_asks_path(@project), notice: "Perguntas criadas com sucesso"
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
end
