class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :customer_name
      t.text :date
      t.integer :amount
      t.references :pawns, foreign_key: true

      t.timestamps
    end
  end
end
