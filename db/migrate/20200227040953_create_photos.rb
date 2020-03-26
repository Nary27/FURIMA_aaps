class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :item, null: false, foreign_key: true
      t.string :url, null: false
      t.timestamps
    end
  end
end
