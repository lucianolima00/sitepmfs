class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :textStatement
      t.string :altA
      t.string :altB
      t.string :altC
      t.string :altD
      t.string :altE
      t.string :correctAlt
      t.references :questionnaire, foreign_key: true

      t.timestamps
    end
  end
end
