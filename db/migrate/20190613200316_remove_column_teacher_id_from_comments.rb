class RemoveColumnTeacherIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :teacher_id, :string
  end
end
