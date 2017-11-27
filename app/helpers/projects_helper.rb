module ProjectsHelper
  def projects_for_testers(tester)
    @project = Project.joins(:publics).where(status: ["sent", "in_progress"]).where("publics.age_range_start <= ?", tester.age).order(created_at: :desc)
  end

  def find_answers(object, tester)
    object.answers.where(tester: tester).first
  end

  def total_of_answers
    project_tasks = @project.tasks.present? ? @project.tasks.count : 0
    project_asks = @project.asks.present? ? @project.asks.count : 0
    @total = project_tasks + project_asks
  end

  def tester_answers_count
    count = 0
    @project.asks.each do |ask|
      if ask.answers.present? 
        ask.answers.each do |answer| 
          answer.tester == @tester
          count = count + 1
        end
      end
    end
    @project.tasks.each do |task|
      if task.answers.present? 
        task.answers.each do |answer| 
          answer.tester == @tester
          count = count + 1
        end
      end
    end
    @count = count
  end

  def awnswer_all_questions(project)
    @project = project
    @tester = Tester.find(5)
    total_of_answers
    tester_answers_count
    @count >= @total
  end
end
