class RemoveDefaultofProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :status
  end
end
