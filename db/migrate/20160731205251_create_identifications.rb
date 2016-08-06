class CreateIdentifications < ActiveRecord::Migration
  def change
    create_table :identifications do |t|
      t.string :text
      t.references :language, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end
