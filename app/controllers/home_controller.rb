class HomeController < ApplicationController
  def index
    if current_user
      redirect_to projects_client_project_path
    # elsif current_tester
    #   redirect_to projects_worker_projects_path
    end
  end

  def index
  end

  def test
  end
end
