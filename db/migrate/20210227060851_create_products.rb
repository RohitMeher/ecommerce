class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :code
      t.integer :quantity
      t.integer :price
      t.string :description1
      t.string :description2
    end
  end
end
