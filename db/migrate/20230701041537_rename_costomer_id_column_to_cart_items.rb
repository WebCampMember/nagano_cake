class RenameCostomerIdColumnToCartItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :costomer_id, :customer_id
  end
end
