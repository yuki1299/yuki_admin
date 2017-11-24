class Answer < ApplicationRecord
  belongs_to :project_answer, polymorphic: true
  belongs_to :tester
end
