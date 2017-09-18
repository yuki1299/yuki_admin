class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :objective
      t.string :url
      t.string :cenary
      t.timestamps
    end
  end
end
