require 'promotional_rules'

describe Promotional_rules do

  subject(:promotional_rules) { described_class.new }

  let(:order) { double(:order, basket: Hash.new(0), total_price: 0) }

  context "#current_order" do

    it "sets the current order to apply promotional discounts to" do
      promotional_rules.current_order(order)
      expect(promotional_rules.order).to eq order
    end

  end


end
