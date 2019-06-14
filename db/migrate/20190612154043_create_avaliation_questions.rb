class CreateAvaliationQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :avaliation_questions do |t|
      t.text :Statement
      t.string :altA
      t.string :altB
      t.string :altC
      t.string :altD
      t.string :altE
      t.references :avaliation, foreign_key: true

      t.timestamps
    end
  end
end
