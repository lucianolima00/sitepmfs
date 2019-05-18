class RemoveColumnUsersIdFromQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    remove_column :questionnaires, :user_id, :bigint
  end
end
