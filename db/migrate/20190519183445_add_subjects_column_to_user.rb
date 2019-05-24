class AddSubjectsColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subjects, :string, array: true, default: []
  end
end
