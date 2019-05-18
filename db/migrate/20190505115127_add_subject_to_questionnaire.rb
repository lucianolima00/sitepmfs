class AddSubjectToQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    add_reference :questionnaires, :subject, foreign_key: true
  end
end
