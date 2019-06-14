class RemoveColumnAlternativesFromQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :alternatives, :boolean
  end
end
