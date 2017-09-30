class RemoveParticipantsOfCredits < ActiveRecord::Migration[5.0]
  def change
    remove_column :credits, :participants
  end
end
