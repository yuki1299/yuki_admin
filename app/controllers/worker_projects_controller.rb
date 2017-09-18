class WorkerProjectsController < ApplicationController
  before_action :authenticate_tester!
  before_action :set_project, only: [:show]

  # GET /projects
  # GET /projects.json
  def index
    @projects_pending   = current_tester.project_testers.pending
    @projects_finisheds = current_tester.project_testers.finished
    @projects = current_tester.project_testers
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project_tester =  current_tester.project_testers.where(project_id: @project.id).pending.first
    
    @project_tester.finish! if @project_tester.present?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
end
