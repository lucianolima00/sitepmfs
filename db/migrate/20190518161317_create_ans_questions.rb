class CreateAnsQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :ans_questions do |t|
      t.string :alt_selected
      t.references :student, foreign_key: true
      t.references :question, foreign_key: true
      t.boolean :correct
      t.timestamps
    end
  end
end
