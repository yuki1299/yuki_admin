class AddGenderAndSchoolingAndLocaleAndRoleAndKindOfDisabilityToTesters < ActiveRecord::Migration[5.0]
  def change
    add_column :testers, :gender, :string
    add_column :testers, :schooling, :string
    add_column :testers, :locale, :string
    add_column :testers, :role, :string
    add_column :testers, :kind_of_disability, :string
  end
end
