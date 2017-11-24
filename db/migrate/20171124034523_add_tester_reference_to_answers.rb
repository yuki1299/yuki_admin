class AddTesterReferenceToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :tester, foreign_key: true
  end
end
