class CreateProjectTesters < ActiveRecord::Migration[5.0]
  def change
    create_table :project_testers do |t|
      t.belongs_to :project, index: true
      t.belongs_to :tester, index: true
      t.string :status
      t.timestamps
    end
  end
end
