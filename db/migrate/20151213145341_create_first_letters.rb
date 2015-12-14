class CreateFirstLetters < ActiveRecord::Migration
  def change
    create_table :first_letters do |t|
      t.string :letter
      t.string :locale
      t.integer :occurences,   default: 0
      t.decimal :frequency,    default: 0

      t.timestamps null: false
    end
    add_index :first_letters, :letter
    add_index :first_letters, :locale
  end
end
