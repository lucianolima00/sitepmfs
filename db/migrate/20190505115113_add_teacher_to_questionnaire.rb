class AddTeacherToQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    add_reference :questionnaires, :teacher, foreign_key: true
  end
end
