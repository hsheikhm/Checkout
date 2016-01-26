require 'promotional_rules'

describe Promotional_rules do

  subject(:promotional_rules) { described_class.new }

  let(:order) { double(:order, basket: {001 => 2}, total_price: 65) }

  context "#current_order and #order" do

    it "sets the current order to apply promotional discounts to" do
      promotional_rules.current_order(order)
      expect(promotional_rules.order).to eq order
    end

  end

  context "#two_or_more_lavender_hearts" do

    it "checks if the basket contains two or more lavender hearts" do
      promotional_rules.current_order(order)
      expect(promotional_rules.two_or_more_lavender_hearts?).to eq true
    end

  end

  context "#total_over_sixty_pounds?" do

    it "checks if the #total_price is over £60" do
      promotional_rules.current_order(order)
      expect(promotional_rules.total_over_sixty_pounds?).to eq true
    end

  end

end
