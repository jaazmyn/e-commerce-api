# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  let(:category) { Category.create!(name: "some category") }
  let(:product) { Product.create!(name: "white shoes", category: category) }
  let(:user) { User.create!(name: "test", email: "test@test.com", password: "123456") }
  let(:order) { Order.create!(date: Date.today, user: user) }
  let(:product_order) { ProductOrder.create!(product: product, order: order, quantity: 4) }

  it "belongs to order" do
    expect(product_order.order).to eq(order)
  end

  it "belongs to product" do
    expect(product_order.product).to eq(product)
  end

  it "has a quantity" do
    expect(product_order.quantity).to eq(4)
  end
end
