class AddRoleAndCompanyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :company, :string
    add_column :users, :role, :string
  end
end
