class AddTeacherToSubject < ActiveRecord::Migration[5.2]
  def change
    add_reference :subjects, :teacher, foreign_key: true
  end
end
