class ScriptController < ApplicationController
  before_filter :set_project
  def list
    @tasks  = @project.tasks
    @asks  	= @project.asks
    @public = @project.publics.first
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
