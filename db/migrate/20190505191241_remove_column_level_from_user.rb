class RemoveColumnLevelFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :level, :string
  end
end
