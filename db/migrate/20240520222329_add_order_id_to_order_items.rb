class AddOrderIdToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :order_id, :integer
    add_index :order_items, :order_id
  end
end
