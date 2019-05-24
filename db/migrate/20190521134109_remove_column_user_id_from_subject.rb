class RemoveColumnUserIdFromSubject < ActiveRecord::Migration[5.2]
  def change
    remove_column :subjects, :user_id, :bigint
  end
end
