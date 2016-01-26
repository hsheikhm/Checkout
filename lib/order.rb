require_relative 'products'

class Order

  LAVENDER_HEARTS_DISCOUNT = 0.75
  MINIMUM_SPEND_DISCOUNT = 0.10

  def initialize(products = Products.new)
    @products_list = products.list
    @basket = Hash.new(0)
    @total_price = 0
  end

  def basket
    @basket
  end

  def add_to_basket(item, quantity = 1)
    basket[item] += quantity
  end

  def calculate_total_price
    basket.each{|itm, qty| @total_price += (products_list[itm][:price] * qty)}
  end

  def number_of_lavender_hearts
    basket[1]
  end

  def apply_lavender_hearts_discount
    @total_price -= (LAVENDER_HEARTS_DISCOUNT * number_of_lavender_hearts)
  end

  def apply_ten_percent_off_discount
    @total_price -= (@total_price * MINIMUM_SPEND_DISCOUNT)
  end

  attr_reader :products_list, :total_price

end
