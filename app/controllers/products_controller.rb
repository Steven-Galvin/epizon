class ProductsController < ApplicationController
  before_action except: [:index, :show, :show_details, :hide_details] do
    flash[:alert] = "Unauthorized user" unless admin
    authorize unless admin
  end

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product added succesfully"
      redirect_to '/'
    else
      flash[:alert] = "There was a problem adding product"
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
