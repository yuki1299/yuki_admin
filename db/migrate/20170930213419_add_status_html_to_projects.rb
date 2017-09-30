class AddStatusHtmlToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :status_html, :string
  end
end
