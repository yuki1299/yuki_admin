class AddObjectiveToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :objective, :string
  end
end
