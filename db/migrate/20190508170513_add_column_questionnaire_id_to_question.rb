class AddColumnQuestionnaireIdToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :questionnaire, foreign_key: true, on_delete: :cascade
  end
end
