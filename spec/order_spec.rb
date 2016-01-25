require 'order'

describe Order do

  subject(:order) { described_class.new(products_klass.new) }

  let(:products) { double(:products, list: {
    001 => { name: "Lavender heart", price: 9.25 },
    002 => { name: "Personalised cufflinks", price: 45.00 },
    003 => { name: "Kids T-shirt", price: 19.95 }
    }) }

  let(:products_klass) { double(:products_klass, new: products) }

  context "#initialize" do

    it "creates a #products_list instance" do
      expect(order).to have_attributes(products_list: products.list)
    end

    it "creates an empty #basket" do
      expect(order).to have_attributes(basket: Hash.new(0))
    end

    it "creates a #total_price property that starts at 0" do
      expect(order).to have_attributes(total_price: 0)
    end

  end

end
