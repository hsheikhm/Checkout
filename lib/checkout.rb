require_relative 'promotional_rules'
require_relative 'order'

class Checkout

  def initialize(promotional_rules = Promotional_rules.new, order = Order.new)
    @promotional_rules = promotional_rules
    @order = order
  end

  def order
    @order
  end

  def promotional_rules
    @promotional_rules
  end

  def scan(item)
    order.add_to_basket(item)
  end

  def total
    order.calculate_total_price
    promotional_rules.current_order(order)
    promotional_rules.apply_discounts
    order.print_final_price
  end

end
