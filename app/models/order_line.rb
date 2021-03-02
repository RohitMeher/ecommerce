class OrderLine < ApplicationRecord
  belongs_to :order

  def product
    Product.find_by({code: item_code})
  end
end