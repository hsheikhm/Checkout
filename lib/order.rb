require_relative 'products'

class Order

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

  attr_reader :products_list, :total_price

end
