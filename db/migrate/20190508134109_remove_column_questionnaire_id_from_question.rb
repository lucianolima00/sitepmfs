class RemoveColumnQuestionnaireIdFromQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :questionnaire_id, :bigint
  end
end
