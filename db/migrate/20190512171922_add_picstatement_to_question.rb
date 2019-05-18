class AddPicstatementToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :picStatement, :string
  end
end
