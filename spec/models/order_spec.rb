# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:category) { Category.create!(name: "some category") }
  let(:product) { Product.create!(name: "white shoes", category: category) }
  let(:user) { User.create!(name: "test", email: "test@test.com", password: "123456") }
  let(:order) { Order.create!(date: Date.today, user: user) }
  let(:product_order) { ProductOrder.create!(product: product, order: order, quantity: 4) }

  it "has a date" do
    expect(order.date).to eq(Date.today)
  end

  it "belongs to a user" do
    expect(order.user).to eq(user)
  end

  it "has many order products" do
    expect(order).to respond_to(:product_orders)
  end
end
