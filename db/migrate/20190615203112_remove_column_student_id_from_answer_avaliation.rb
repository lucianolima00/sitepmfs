class RemoveColumnStudentIdFromAnswerAvaliation < ActiveRecord::Migration[5.2]
  def change
    remove_column :answer_avaliations, :student_id, :bigint
  end
end
