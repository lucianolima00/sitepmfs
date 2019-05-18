class AddColumnSubjectNameToSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :subjectName, :string
  end
end
