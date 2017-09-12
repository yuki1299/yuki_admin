class AddAgeToTesters < ActiveRecord::Migration[5.0]
  def change
    add_column :testers, :age, :integer
  end
end
