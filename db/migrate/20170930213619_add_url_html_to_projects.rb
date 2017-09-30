class AddUrlHtmlToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :url_html, :string
  end
end
