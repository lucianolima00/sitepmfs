class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.string :subject
      t.integer :noQuestion

      t.timestamps
    end
  end
end
