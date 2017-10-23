class AddFullNameToTesters < ActiveRecord::Migration[5.0]
  def change
    add_column :testers, :full_name, :string
  end
end
