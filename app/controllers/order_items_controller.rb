class OrderItemsController < ApplicationController

  def create
    @order = current_order
    item_check(item_params)
    @order.save
    session[:order_id] = @order.id
    flash[:notice] = "Item added to cart"
    respond_to do |format|
      format.js { redirect_to products_path }
    end
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    @order.save
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
    respond_to do |format|
      format.js
    end
  end

  private

  def item_check(item_params)
    product_id = item_params['product_id'].to_i
    quantity = item_params['quantity'].to_i
    order = current_order.order_items
    if order.exists?(product_id: product_id)
      item = order.where(product_id: product_id)
      item.first.quantity += quantity
      item.first.save
    else
      @order.order_items.new(item_params)
    end
  end

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
