# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:user) { User.create!(name: "test", email: "test@test.com", password: "123456") }
  let(:cart) { Cart.create!(user: user) }

  it "belongs to a user" do
    expect(cart.user).to eq(user)
  end

  it "has many cart products" do
    expect(cart).to respond_to(:cart_products)
  end
end
