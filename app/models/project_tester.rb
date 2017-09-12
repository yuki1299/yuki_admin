class ProjectTester < ApplicationRecord
  include AASM

  belongs_to :project
  belongs_to :tester

  aasm column: :status do 
    state :pending, initial: true
    state :finished

    event :finish do
      transitions from: :pending, to: :finished
    end
  end
end
