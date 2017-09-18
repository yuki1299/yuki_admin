class ChangeNameHtmlColumnOnProject < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :name_html, :url_html
  end
end
