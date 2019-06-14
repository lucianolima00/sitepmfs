class RemoveColumnNoQuestionFromAvaliation < ActiveRecord::Migration[5.2]
  def change
    remove_column :avaliations, :noQuestion, :integer
  end
end
