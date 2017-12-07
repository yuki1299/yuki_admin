class Answer < ApplicationRecord
  belongs_to :project_answer, polymorphic: true
  belongs_to :tester
  validates :testers_answer, presence: true
end
