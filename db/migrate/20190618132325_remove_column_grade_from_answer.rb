class RemoveColumnGradeFromAnswer < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :grade, :integer
  end
end
