class Products

  PRODUCTS_LIST = {
    001 => { name: "Lavender heart", price: 9.25 },
    002 => { name: "Personalised cufflinks", price: 45.00 },
    003 => { name: "Kids T-shirt", price: 19.95 }
  }

  def initialize
    @list = PRODUCTS_LIST
  end

  attr_reader :list

end
