class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.boolean :online
      t.text :memo

      t.timestamps
    end
  end
end
