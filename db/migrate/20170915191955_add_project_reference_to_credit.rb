class AddProjectReferenceToCredit < ActiveRecord::Migration[5.0]
  def change
    add_reference :credits, :project, foreign_key: true
  end
end
