class ProductsController < ApplicationController
  def index 
    @products=Product.all
  end
  def new
  end
  def show
    logger.info "Product is #{@product}"
    @product = Product.find(params[:id])
  end
  def create
    @product=Product.new(product_params)
    @product.save
    redirect_to @product
  end
  def show_image
    @product = Product.find(params[:id])
    send_data @product.productImage, :type => 'image/jpg'
  end
  private
  def product_params
    params.require(:product).permit(:productName, :brandName, :averageCost, :category, :dateReleased, :description, :productImage)
  end
end
