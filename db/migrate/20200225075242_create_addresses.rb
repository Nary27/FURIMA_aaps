class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.integer :user_id
      t.string :postcode,           null:false
      t.integer :prefecture_id,     null:false 
      t.string :cities,             null:false
      t.string :blocks,             null:false
      t.string :builds     
      
      t.timestamps
    end

  end
end
