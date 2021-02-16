# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "test", email: "test@test.com", password: "123456") }

  it "has a valid name" do
    expect(user.name).to eq("test")
  end

  it "has a valid email" do
    expect(user.email).to eq("test@test.com")
  end

  it "has many orders" do
    expect(user).to respond_to(:orders)
    expect(user.orders.count).to eq(0)
  end

  it "has many carts" do
    expect(user).to respond_to(:carts)
    expect(user.carts.count).to eq(0)
  end
end
