class RemoveColumnNumFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :num, :integer
  end
end
