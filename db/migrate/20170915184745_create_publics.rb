class CreatePublics < ActiveRecord::Migration[5.0]
  def change
    create_table :publics do |t|
      t.integer :age_range_start
      t.integer :age_range_end
      t.string  :gender
      t.string  :schooling
      t.string  :locale
      t.string  :role
      t.string  :kind_of_disability
      t.timestamps
    end
  end
end
