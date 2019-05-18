class RemoveColumnTeacherIdFromSubject < ActiveRecord::Migration[5.2]
  def change
    remove_column :subjects, :teacher_id, :bigint
  end
end
