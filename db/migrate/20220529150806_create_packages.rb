class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.boolean :is_active

      t.timestamps
    end
    add_index :packages, :slug, unique: true
  end
end
