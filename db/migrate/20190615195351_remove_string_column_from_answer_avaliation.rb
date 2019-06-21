class RemoveStringColumnFromAnswerAvaliation < ActiveRecord::Migration[5.2]
  def change
    remove_column :answer_avaliations, :string, :string
  end
end
