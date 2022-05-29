class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.string :symbol
      t.string :decimal_mark, null: false, default: '.'
      t.string :thousand_mark, null: false, default: ','

      t.timestamps
    end
    add_index :currencies, :code, unique: true
  end
end
