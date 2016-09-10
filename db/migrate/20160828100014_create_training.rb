class CreateTraining < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :text
      t.boolean :processed
      t.references :language, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end
