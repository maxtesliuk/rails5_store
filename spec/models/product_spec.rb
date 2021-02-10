require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is not valid without a title" do
    product = Product.new(name: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a price" do
    product = Product.new(price: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a inward_date" do
    product = Product.new(inward_date: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a type" do
    product = Product.new(type: nil)
    expect(product).to_not be_valid
  end
end
