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

end
