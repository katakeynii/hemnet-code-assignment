class CreateMunicipalities < ActiveRecord::Migration[7.0]
  def change
    create_table :municipalities do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :municipalities, :slug, unique: true
  end
end
