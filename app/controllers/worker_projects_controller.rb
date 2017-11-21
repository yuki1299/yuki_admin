class WorkerProjectsController < ApplicationController
  include ProjectsHelper
  before_action :authenticate_tester!
  before_action :set_project, only: [:show]

  # GET /projects
  # GET /projects.json
  def index
    @projects = projects_for_testers(current_tester)
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
