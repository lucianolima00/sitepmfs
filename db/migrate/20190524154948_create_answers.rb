class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :student_id, foreign_key: true
      t.refereneces :questionnaire_id
      t.string :answers[]
      t.integer :grade

      t.timestamps
    end
  end
end
