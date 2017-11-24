class AddAnswersPolymorphic < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :project_answer_id, :integer
    add_column :answers, :project_answer_type, :string    
  end
end
