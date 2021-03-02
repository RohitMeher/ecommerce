class AddTotalPriceColoumnToOrderLinesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :order_lines, :price, :integer
  end
end
