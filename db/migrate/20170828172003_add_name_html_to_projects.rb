class AddNameHtmlToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :name_html, :text
  end
end
