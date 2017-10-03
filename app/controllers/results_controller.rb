class ResultsController < ApplicationController
  before_filter :set_project
  def list
    @publics = @project.public
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
