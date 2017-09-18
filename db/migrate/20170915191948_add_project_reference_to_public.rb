class AddProjectReferenceToPublic < ActiveRecord::Migration[5.0]
  def change
    add_reference :publics, :project, foreign_key: true
  end
end
