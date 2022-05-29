class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.string :currency_code
      t.references :currency, null: false, foreign_key: true
      t.references :package, null: false, foreign_key: true
      t.references :municipality, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
      t.index [:currency_id, :package_id, :municipality_id], unique: true
    end
  end
end
