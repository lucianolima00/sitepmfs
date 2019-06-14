class AddColumnAlternativesToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :alternatives, :boolean
  end
end
