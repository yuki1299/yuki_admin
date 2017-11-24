module ProjectsHelper
  def projects_for_testers(tester)
    @project = Project.joins(:publics).where(status: "sent").where("publics.age_range_start <= ?", tester.age)
  end

  def find_answers(task, tester)
    task.answers.where(tester: tester).first
  end
end
