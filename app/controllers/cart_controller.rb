class CartController < ApplicationController

  before_action :is_user_logged_in

  def index
    @order = current_user.current_order
  end
  
  def checkout
    @user = current_user
    if @order = @user.current_order
      @address = @order.address
    else
      flash[:error] = "You don't have any order in the cart"
      redirect_to user_products_path
    end
  end

  def update_cart
    delete_order_params = params[:update_cart][:delete] if params[:update_cart]
    if delete_order_params
      order = Order.find(delete_order_params[:order_id])
      order_line = order.order_lines.where(:id => delete_order_params[:order_line_id]).first
      if order_line
        product = order_line.product
        product.quantity = product.quantity + order_line.quantity
        product.save
        order.amount = order.amount - order_line.quantity * product.price
        if order_line.destroy
          order.save
          flash[:notice] = "Product removed from the cart successfully"
        else
          flash[:error] = order_line.errors.full_messages.join("/n")
        end
      end
    end
    redirect_to cart_index_path
  end

  def finalise
    cart_params = params[:cart]
    address = Address.find(cart_params["address_id"])
    @order = current_user.current_order
    @order.address = address
    @order.payment_mode = cart_params["payment_option"]
    @order.status = Order::Status::ORDER_CONFIRMED
    if @order.save
      redirect_to order_confirmation_path
    else
      flash[:error] = @order.error_messages.join("/n")
      redirect_to cart_checkout_path
    end
  end

  def order_confirmation
    @order = current_user.orders.where(:status => Order::Status::ORDER_CONFIRMED).last
  end
end