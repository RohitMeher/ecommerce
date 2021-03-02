class CreateOrderLines < ActiveRecord::Migration[6.0]
  def change
    create_table :order_lines do |t|
      t.references :order
      t.string     :item_code
      t.integer    :quantity
    end
  end
end
