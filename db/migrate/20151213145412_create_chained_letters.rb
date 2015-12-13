class CreateChainedLetters < ActiveRecord::Migration
  def change
    create_table :chained_letters do |t|
      t.string :first_letter
      t.string :second_letter
      t.string :language
      t.integer :occurences,   default: 0
      t.decimal :frequency,    default: 0

      t.timestamps null: false
    end
    add_index :chained_letters, :first_letter
    add_index :chained_letters, :second_letter
    add_index :chained_letters, :language
  end
end
