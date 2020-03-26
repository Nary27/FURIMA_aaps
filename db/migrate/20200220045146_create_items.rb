class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :brand, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false
      t.text :text, null: false
      t.string :cost, null: false
      t.string :situation, null: false
      t.string :deliver_area, null: false
      t.string :shipping_term, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
