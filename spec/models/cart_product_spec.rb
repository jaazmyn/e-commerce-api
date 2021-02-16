# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  let(:category) { Category.create!(name: "some category") }
  let(:product) { Product.create!(name: "white shoes", category: category) }
  let(:user) { User.create!(name: "test", email: "test@test.com", password: "123456") }
  let(:cart) { Cart.create!(user: user) }
  let(:cart_product) { CartProduct.create!(product: product, cart: cart, quantity: 4) }

  it "belongs to cart" do
    expect(cart_product.cart).to eq(cart)
  end

  it "belongs to product" do
    expect(cart_product.product).to eq(product)
  end

  it "has a quantity" do
    expect(cart_product.quantity).to eq(4)
  end
end
