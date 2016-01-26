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

end
