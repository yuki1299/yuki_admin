class AddNumberAnswersToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :number_answers, :integer, default: 0
  end
end
