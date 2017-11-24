class AddTaskAndAskReferenceToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :task, foreign_key: true
    add_reference :answers, :ask, foreign_key: true
  end
end
