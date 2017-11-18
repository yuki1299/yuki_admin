class CreditsController < ApplicationController
  before_action :set_project
  before_action :set_credit, only: [:show, :edit, :update, :destroy, :change]

  def index
    @credits = @project.credits
  end

  def new
    @credit = @project.credits.new
  end

  def create
    @credit = @project.credits.new

    if @credit.save
      @project.to_sent
      @project.save
      redirect_to project_script_path
    else
      redirect_to project_credits_path(@project)
    end
  end

  def edit
  end

  def update
    if @credit.update_attributes(credit_params)
      redirect_to project_credits_path(@project), notice: "Quantidade de testadores atualizada com sucesso"
    else
      redirect_to project_credits_path(@project), alert: "Não foi possível atualizar a quantidade de testadores"
    end
  end

  def destroy
    if @credit.destroy
      redirect_to project_credits_path(@project)
    else
      redirect_to project_credits_path(@project)
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_credit
    @credit = @project.credit.find(params[:id])
  end

end
