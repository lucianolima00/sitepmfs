class AddColumnRegNumberToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :regNumber, :bigInt
  end
end
