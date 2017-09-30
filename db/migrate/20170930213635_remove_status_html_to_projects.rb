class RemoveStatusHtmlToProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :status_html
  end
end
