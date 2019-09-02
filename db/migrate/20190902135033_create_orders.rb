class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	has_many :item_orders
    	has_many :items, through: :item_orders

      t.timestamps
    end
  end
end
