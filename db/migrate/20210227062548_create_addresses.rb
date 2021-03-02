class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :post_code
      t.string :phone_number
      t.references :addressable, polymorphic: true
    end
  end
end
