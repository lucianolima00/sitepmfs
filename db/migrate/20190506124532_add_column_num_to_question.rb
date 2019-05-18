class AddColumnNumToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :num, :integer
  end
end
