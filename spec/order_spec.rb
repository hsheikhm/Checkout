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

  context "#add_to_basket" do

    it "adds an item to the basket" do
      order.add_to_basket(001)
      expect(order.basket).not_to be_empty
      expect(order.basket[001]).to eq 1
    end

  end

  context "#calculate_total_price" do

    it "sets the #total_price" do
      order.add_to_basket(001)
      order.add_to_basket(002)
      order.calculate_total_price
      expect(order.total_price).to eq 54.25
    end

  end

  context "#number_of_lavender_hearts" do

    it "retrieves the number of lavender hearts in the basket" do
      order.add_to_basket(001)
      order.add_to_basket(001)
      expect(order.number_of_lavender_hearts).to eq 2
    end

  end

  context "discounts" do

    it "#apply_lavender_hearts_discount if 2 or more lavender hearts" do
      3.times{ order.add_to_basket(001) }
      order.calculate_total_price
      expect(order.total_price).to eq 27.75
      order.apply_lavender_hearts_discount
      expect(order.total_price).to eq 25.5
    end

    it "#apply_ten_percent_off_discount when #total_price is over £60" do
      10.times{ order.add_to_basket(001) }
      order.calculate_total_price
      expect(order.total_price).to eq 92.5
      order.apply_ten_percent_off_discount
      expect(order.total_price).to eq 83.25
    end

  end

  context "#print_final_price" do

    it "prints the final price after discounts are applied" do
      3.times{ order.add_to_basket(001) }
      order.calculate_total_price
      order.apply_lavender_hearts_discount
      expect(order.print_final_price).to eq "£25.5"
    end

  end

end
