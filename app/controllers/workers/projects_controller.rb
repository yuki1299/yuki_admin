class Workers::ProjectsController < ApplicationController
  before_action :authenticate_tester!
  before_action :set_project, only: [:show]

  # GET /projects
  # GET /projects.json
  def index
    @active   = current_user.projects.where(status: "Ativo")
    @waiting  = current_user.projects.where(status: "Aguardando Resposta")
    @finished = current_user.projects.where(status: "Finalizado")
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
end
