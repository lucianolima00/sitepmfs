class AddColumnSchoolroomIdToStudent < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :schoolroom, foreign_key: true
  end
end
