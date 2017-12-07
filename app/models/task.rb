class Task < ApplicationRecord
  belongs_to :project
  has_many :answers, as: :project_answer
  validates :objective, presence: true
  validates :url, presence: true
  validates :cenary, presence: true
end
