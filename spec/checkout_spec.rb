require 'checkout'

describe Checkout do

  subject(:checkout) { described_class.new(promotional_rules_klass.new, order_klass.new) }

  let(:promotional_rules) { double(:promotional_rules) }
  let(:promotional_rules_klass) { double(:promotional_rules_klass, new: promotional_rules) }

  let(:order) { double(:order) }
  let(:order_klass) { double(:order_klass, new: order) }


  context "#initialize" do

    it "creates a new #Promotional_rules instance" do
      expect(checkout).to have_attributes(promotional_rules: promotional_rules)
    end

    it "creates a new #Order instance" do
      expect(checkout).to have_attributes(order: order)
    end

  end

  context "#scan" do

    it "adds an item to the order's basket" do
      item = 001
      allow(order).to receive(:add_to_basket).with(item)
      allow(order).to receive(:basket) { {001 => 1} }
      expect(order).to receive(:add_to_basket).with(item)
      checkout.scan(item)
      expect(order.basket).not_to be_empty
    end

  end

  context "#total" do

    before do
      allow(order).to receive(:calculate_total_price)
      allow(promotional_rules).to receive(:current_order).with(order)
      allow(promotional_rules).to receive(:apply_discounts)
      allow(order).to receive(:print_final_price) { "£9.25" }
      allow(order).to receive(:add_to_basket).with(001)
    end

    it "calculates the total price of the #order" do
      expect(order).to receive(:calculate_total_price)
      checkout.total
    end

    it "sets the current order to apply promotional discounts to" do
      expect(promotional_rules).to receive(:current_order).with(order)
      checkout.total
    end

    it "applies any discounts available" do
      expect(promotional_rules).to receive(:apply_discounts)
      checkout.total
    end

    it "prints the final price" do
      expect(order).to receive(:print_final_price)
      checkout.total
      expect(checkout.total).to eq "£9.25"
    end

  end

end
