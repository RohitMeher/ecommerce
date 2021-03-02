class Product < ApplicationRecord
  validates :code, uniqueness: true
  validates :title, :price, :quantity, presence: true

  def self.instock_products
    where('quantity > 0')
  end
end