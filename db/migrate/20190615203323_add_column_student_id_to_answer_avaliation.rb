class AddColumnStudentIdToAnswerAvaliation < ActiveRecord::Migration[5.2]
  def change
    add_reference :answer_avaliations, :student, foreign_key: true
  end
end
