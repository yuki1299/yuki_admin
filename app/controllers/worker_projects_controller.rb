class WorkerProjectsController < ApplicationController
  before_action :authenticate_tester!
  before_action :set_project, only: [:show]

  # GET /projects
  # GET /projects.json
  def index
    @projects_availables = current_tester.project_testers.where(status: "sent") if current_tester.project_testers.present?
    @projects_in_progress = current_tester.project_testers.where(status: "in_progress") if current_tester.project_testers.present?
    @projects_finisheds = current_tester.project_testers.where(status: "finished") if current_tester.project_testers.present?
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project_tester =  current_tester.project_testers.where(project: params[:id]).first
    @project.progress if @project_tester.present?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
end
