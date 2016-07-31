class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :locale
      t.string :name
      t.string :local_name

      t.timestamps null: false
    end

    add_reference :first_letters, :language, index: true, foreign_key: true
    add_reference :chained_letters, :language, index: true, foreign_key: true

    remove_column :first_letters, :locale
    remove_column :chained_letters, :locale
  end
end
