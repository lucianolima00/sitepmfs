class CreateAnswerAvaliations < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_avaliations do |t|
      t.references :student, foreign_key: true
      t.references :avaliation, foreign_key: true
      t.string :answers, :string, array: true, default: []
      t.text :comment

      t.timestamps
    end
  end
end
