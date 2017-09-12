class PagesController < ApplicationController
  def home
    if current_user || current_tester
      redirect_to projects_path
    end
  end

  def home
  end

  def test
  end
end
