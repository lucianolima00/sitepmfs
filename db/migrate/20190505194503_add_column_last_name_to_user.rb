class AddColumnLastNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lastName, :string
  end
end
