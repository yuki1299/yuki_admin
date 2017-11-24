class Task < ApplicationRecord
  belongs_to :project
  has_many :answers, as: :project_answer
end
