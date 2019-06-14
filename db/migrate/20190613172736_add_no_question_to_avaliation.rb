class AddNoQuestionToAvaliation < ActiveRecord::Migration[5.2]
  def change
    add_column :avaliations, :noQuestion, :integer
  end
end
