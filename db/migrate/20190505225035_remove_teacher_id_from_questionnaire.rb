class RemoveTeacherIdFromQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    remove_column :questionnaires, :teacher_id, :bigint
  end
end
