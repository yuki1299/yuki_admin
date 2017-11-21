class PublicsController < ApplicationController
  before_action :set_project
  before_action :set_public, only: [:show, :edit, :update, :destroy, :change]

  def index
    @publics = @project.publics
  end

  def show
    @publics = @project.publics
  end

  def new
    @public = @project.publics.new
  end

  def create
    @public = @project.publics.new(public_params)

    if @public.save
      redirect_to new_project_credit_path(@project), notice: "Público definido com sucesso"
    else
      redirect_to new_project_public_path(@project), alert: "Não foi possível definir um público"
    end
  end

  def edit
  end

  def update
    if @public.update_attributes(public_params)
      redirect_to new_project_credit_path(@project), notice: "Filtro atualizado com sucesso"
    else
      redirect_to project_publics_path(@project), alert: "Não foi possível atualizar o filtro"
    end
  end

  def destroy
    if @public.destroy
      redirect_to project_publics_path(@project), notice: "Filtro apagado com sucesso"
    else
      redirect_to project_publics_path(@project), alert: "Não foi possível apagar seu filtro"
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_public
    @public = @project.publics.find(params[:id])
  end

  def public_params
    params.require(:public).permit(:age_range_start, :age_range_end, :gender, :schooling, :locale, :role, :kind_of_disability, :participants)
  end
end
