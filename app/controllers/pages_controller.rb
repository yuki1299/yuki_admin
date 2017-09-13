class PagesController < ApplicationController
  def home
    if current_user
      redirect_to projects_client_project_path
    # elsif current_tester
    #   redirect_to projects_worker_projects_path
    end
  end

  def home
  end

  def test
  end
end
