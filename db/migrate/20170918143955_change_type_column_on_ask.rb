class ChangeTypeColumnOnAsk < ActiveRecord::Migration[5.0]
  def change
    rename_column :asks, :type, :ask_type
  end
end
