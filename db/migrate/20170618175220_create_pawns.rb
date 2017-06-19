class CreatePawns < ActiveRecord::Migration[5.1]
  def change
    create_table :pawns do |t|
      t.string :pawn_number
      t.text :name
      t.text :date_initialized
      t.integer :principle

      t.timestamps
    end
  end
end
