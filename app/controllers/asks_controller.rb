class AsksController < ApplicationController
  before_action :set_project
  before_action :set_ask, only: [:show, :edit, :update, :destroy, :change]

  def index
    @asks = @project.asks
  end

  def show
  end

  def new
    @ask = @project.asks.new
  end

  def create
    @ask = @project.asks.new(ask_params)

    if @ask.save
      redirect_to new_project_public_path(@project), notice: "Perguntas criadas com sucesso"
    else
      redirect_to new_project_ask_path(@project), alert: "Não foi possível cadastrar as perguntas"
    end
  end

  def edit
  end

  def update
    if @ask.update_attribute(ask_params)
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
    @project = Project.find(params[:project_id])
  end

  def set_ask
    @ask = @project.ask.find(params[:id])
  end

  def ask_params
    params.require(:ask).permit(:ask_type, :question)
  end
end
