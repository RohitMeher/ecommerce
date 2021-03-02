class UserController < ApplicationController
  before_action :is_user_logged_in, only: [:products, :add_to_cart]

  def save_user_details
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Your account is succesfully Created"
      login_as user
      redirect_to user_products_path
    else
      flash[:error] = user.errors.full_messages.join("/n")
      redirect_to user_signup_path
    end
  end

  def products
    @products = Product.instock_products
  end

  def authenticate
    user_params = params[:user]
    user = User.find_by(email: user_params[:email])
    if user && user.password == user_params[:password]
      flash[:notice] = "login is succesfull"
      login_as user
      redirect_to user_products_path
    else
      flash[:error] = "Your Email Address or password is incorrect"
      redirect_to user_login_path
    end
  end

  def add_to_cart
    add_to_cart_params = params[:add_to_cart]
    quantity = add_to_cart_params[:quantity].to_i
    product = Product.find(add_to_cart_params[:product_id])
    if order = current_user.current_order
      if order_line = order.order_lines.where(item_code: product.code).first
        order_line.quantity = order_line.quantity + quantity
        order_line.price = order_line.quantity * product.price
        order_line.save
      else
        order.order_lines.create({item_code: product.code, quantity: quantity, price: quantity*(product.price)})
      end
      flag = order.save
    else
      order = current_user.orders.create({status: Order::Status::IN_PROGRESS})
      order.order_lines.create({item_code: product.code, quantity: quantity, price: quantity*(product.price)})
      flag = order.save      
    end
    if flag
      product.quantity = product.quantity - quantity
      product.save

      order.amount = order.order_lines.sum(:price)
      unless order.address
        address = current_user.addresses.first.dup
        order.address =  address if address
      end
      order.save

      flash[:notice] = "Product added to cart succesfully"
      redirect_to cart_index_path
    else
      flash[:error]  = order.errors.full_messages.join("/n")
      redirect_to user_products_path
    end
  end

  def logout
    super
    flash[:notice] = "You are logged out sucessfully"
    redirect_to user_login_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone, :addresses_attributes => [:address1, :address2, :address3, :post_code ])
  end
end