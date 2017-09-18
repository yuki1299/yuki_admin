class ChangeObjectiveColumnOnProject < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :objective, :url
  end
end
