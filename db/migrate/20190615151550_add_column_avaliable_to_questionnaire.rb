class AddColumnAvaliableToQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :avaliable, :boolean, default: 'FALSE'
  end
end
