class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_table :payments do |t|
    t.rename :pawns_id, :pawn_id
    end
  end
end
