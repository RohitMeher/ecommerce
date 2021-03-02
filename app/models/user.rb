class User < ApplicationRecord
  has_many :orders
  has_many :addresses, :as => :addressable
  accepts_nested_attributes_for :addresses

  validates :email, uniqueness: true
  validates :first_name, :password, :last_name, presence: true

  def current_order
    orders.where(:status => Order::Status::IN_PROGRESS).first
  end

end