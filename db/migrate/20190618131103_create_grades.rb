class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.integer :grade
      t.references :student, foreign_key: true
      t.references :questionnaire, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :schoolroom, foreign_key: true

      t.timestamps
    end
  end
end
