class AddSubjectsColumnToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :subjects, :string, array: true, default: []
  end
end
