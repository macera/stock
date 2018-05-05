class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.date :purchased_date
      t.date :start_date
      t.date :end_date
      t.integer :quantity
      t.integer :quantity_type
      t.boolean :less
      t.text :memo
      t.references :supply, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
