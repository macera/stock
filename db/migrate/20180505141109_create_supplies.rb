class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.string :name
      t.integer :price
      t.text :memo
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
