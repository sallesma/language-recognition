class UniqueColumn < ActiveRecord::Migration
  def change
    add_index :languages, :locale, unique: true
  end
end
