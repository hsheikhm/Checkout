require_relative 'products'

class Order

  def initialize(products = Products.new)
    @products_list = products.list
    @basket = Hash.new(0)
    @total_price = 0
  end

  attr_reader :products_list

end
