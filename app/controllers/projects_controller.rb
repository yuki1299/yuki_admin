class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy, :change]

  # GET /projects
  # GET /projects.json
  def index
    @draft        = current_user.projects.where(status: "draft")
    @sent         = current_user.projects.where(status: "sent")
    @in_progress  = current_user.projects.where(status: "in_progress")
    @finished     = current_user.projects.where(status: "finished")
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        Tester.all.each do |tester|
          @project.project_testers.create(project: @project, tester: tester)
        end
        format.html { redirect_to new_project_task_path(@project), notice: 'Projeto criado com sucesso' }
        format.json { render :show, url: :created, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_tasks_path(@project), notice: 'Projeto atualizado com sucesso' }
        format.json { render :show, url: :ok, status: :ok, location: @project }
      else
        format.html { render :edit, alert: 'Não foi possível atualizar o seu projeto' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    if @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_path, notice: 'Projeto apagado com sucesso' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to projects_path, alert: 'Não foi possível apagar o projeto' }
        format.json { head :no_content }
      end
    end
  end

  def change
    @project.update_attributes(status: params[:status])
    respond_to do |format|
      format.html {redirect_to projects_path, notice: 'Projeto Atualizado'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :test_platform, :url, :status)
    end
end
