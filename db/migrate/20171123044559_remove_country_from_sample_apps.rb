class RemoveCountryFromSampleApps < ActiveRecord::Migration[5.0]
  def change
    remove_reference :answers, :task, foreign_key: true
    remove_reference :answers, :ask, foreign_key: true
  end
end
