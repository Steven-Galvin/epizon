module CartHelper
  def cart_items
    total = 0
    current_order.order_items.each do |item|
      total += item.quantity
    end
    total
  end
end
