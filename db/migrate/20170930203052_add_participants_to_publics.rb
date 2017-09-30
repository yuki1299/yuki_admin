class AddParticipantsToPublics < ActiveRecord::Migration[5.0]
  def change
    add_column :publics, :participants, :integer
  end
end
