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

  attr_reader :products_list, :total_price

end
