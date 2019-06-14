class AddColumnTeacherIdToAvaliation < ActiveRecord::Migration[5.2]
  def change
    add_reference :avaliations, :teacher, foreign_key: true
  end
end
