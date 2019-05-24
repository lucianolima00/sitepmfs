class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grade do |t|
      t.integer :grade
      t.references :subject, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
