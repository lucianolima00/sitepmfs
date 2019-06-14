class CreateAvaliations < ActiveRecord::Migration[5.2]
  def change
    create_table :avaliations do |t|
      t.references :teacher, foreign_key: true
      t.boolean :model

      t.timestamps
    end
  end
end
