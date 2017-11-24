class RemoveNumberOfAnswersOfProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :number_answers
  end
end
