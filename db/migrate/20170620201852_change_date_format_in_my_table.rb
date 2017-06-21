class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.1]
  def up
    change_column :pawns, :pawn_number, :integer
  end  
  def down
    change_column :pawns, :pawn_number, :string
  end

end
