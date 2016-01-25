require 'products'

describe Products do

  subject(:products) { described_class.new }

  context "#initialize" do
    it "creates a #list of products" do
      expect(products.list).to eq described_class::PRODUCTS_LIST
    end
  end

end
