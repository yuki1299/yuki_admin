class CreateAsks < ActiveRecord::Migration[5.0]
  def change
    create_table :asks do |t|
      t.string :type
      t.string :question
      t.timestamps
    end
  end
end
