class AddColumnLevelToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :level, :string
  end
end
