class CreateAcceptedCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :accepted_currencies do |t|
      t.references :municipality, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
