class Order < ApplicationRecord
  has_many :order_lines
  belongs_to :user
  has_one :address, :as => :addressable

  module Status
    IN_PROGRESS = "in_progress"
    ORDER_CONFIRMED = "order_confirmed"
    COMPLETED = "completed"
  end
end