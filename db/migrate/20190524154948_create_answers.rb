class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :student, foreign_key: true
      t.references :questionnaire, foreign_key: true
      t.string :answers, :string, array: true, default: []
      t.integer :grade

      t.timestamps
    end
  end
end
