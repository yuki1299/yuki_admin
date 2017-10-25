class RegisterConfirmationController < ApplicationController
  def complete_tester
    if current_user
      redirect_to projects_client_project_path
    # elsif current_tester
    #   redirect_to projects_worker_projects_path
    end
  end

  def complete_user
  end

  def fail_tester
  end
end
