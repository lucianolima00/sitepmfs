class RemoveColumnStringFromAnswer < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :string, :string
  end
end
