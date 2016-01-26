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

end
