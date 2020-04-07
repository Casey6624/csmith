class ProductsController < ApplicationController
  def index 
    @products=Product.all
  end
  def new
  end
  def show
    @product = Product.find(params[:id])
    logger.info "Product is #{@product}"
  end
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to @product
  end
  private
  def product_params
    params.require(:product).permit(:productName, :brandName, :averageCost, :category, :dateReleased, :description, :productImg)
  end
end
