class AddTestPlatformToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :test_platform, :string
  end
end
