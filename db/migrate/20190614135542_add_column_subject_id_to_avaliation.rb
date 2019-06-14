class AddColumnSubjectIdToAvaliation < ActiveRecord::Migration[5.2]
  def change
    add_reference :avaliations, :subject, foreign_key: true
  end
end
