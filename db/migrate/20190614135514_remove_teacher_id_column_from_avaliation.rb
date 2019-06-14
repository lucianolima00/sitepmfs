class RemoveTeacherIdColumnFromAvaliation < ActiveRecord::Migration[5.2]
  def change
    remove_column :avaliations, :teacher_id, :bigint
  end
end
