class RemoveUrlHtmlOfProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :url_html
  end
end
