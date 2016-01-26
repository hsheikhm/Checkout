class Promotional_rules

  MIN_LAVENDER_HEARTS = 2
  MINIMUM_SPEND = 60

  def current_order(order)
    @order = order
  end

  def order
    @order
  end

  def apply_discounts
    order.apply_lavender_hearts_discount if two_or_more_lavender_hearts?
    order.apply_ten_percent_off_discount if total_over_sixty_pounds?
    # "£#{(order.total_price).round(2)}"
  end

  def two_or_more_lavender_hearts?
    order.basket[1] >= MIN_LAVENDER_HEARTS
  end

  def total_over_sixty_pounds?
    order.total_price > MINIMUM_SPEND
  end

end
