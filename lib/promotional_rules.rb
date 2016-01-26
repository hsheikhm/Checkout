class Promotional_rules

  MIN_LAVENDER_HEARTS = 2
  MINIMUM_SPEND = 60

  def current_order(order)
    @order = order
  end

  def order
    @order
  end

  def two_or_more_lavender_hearts?
    order.basket[1] >= MIN_LAVENDER_HEARTS
  end

  def total_over_sixty_pounds?
    order.total_price > MINIMUM_SPEND
  end

end
