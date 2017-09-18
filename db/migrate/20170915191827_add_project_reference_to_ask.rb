class AddProjectReferenceToAsk < ActiveRecord::Migration[5.0]
  def change
    add_reference :asks, :project, foreign_key: true
  end
end
