class AddSalerIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :seller_id, :string
  end
end
