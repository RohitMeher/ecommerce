class ProductsController < AdminController
  before_action :is_user_logged_in

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    product = Product.new(product_params)
    if product.save
      flash[:notice] = "Product Created Succesfully"
      redirect_to product_path(product)
    else
      flash[:error] = product.errors.full_messages.join("/n")
      redirect_to new_product_path
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:notice] = "Product updated Succesfully"      
    else
      flash[:error] = @product.errors.full_messages.join("/n")
    end
    redirect_to product_path(@product)
  end
  
  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "Product is Deleted Succesfully"
    else
      flash[:error] = @product.errors.full_messages.join("/n")
    end
    redirect_to products_path
  end

  def delete_all
    if Product.destroy_all
      flash[:notice] = "All Products are Deleted Succesfully"
    else
      flash[:error] = "Something went wrong please try later"
    end
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:title, :code, :quantity, :price, :description1, :description2)
  end
end