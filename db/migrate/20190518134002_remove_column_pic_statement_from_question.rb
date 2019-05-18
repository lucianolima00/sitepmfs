class RemoveColumnPicStatementFromQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :picStatement, :string
  end
end
