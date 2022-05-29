class CreatePriceUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :price_updates do |t|
      t.references :price, null: false, foreign_key: true
      t.decimal :amount_before
      t.decimal :amount_after
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
