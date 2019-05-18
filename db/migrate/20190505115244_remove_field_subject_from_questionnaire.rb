class RemoveFieldSubjectFromQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    remove_column :questionnaires, :subject, :string
  end
end
