# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.create!(name: "some category") }
  let(:product) { Product.create!(name: "white shoes", category: category) }

  it "has a name" do
    expect(product.name).to eq("white shoes")
  end

  it "belongs to a category" do
    expect(product.category).to eq(category)
  end
end
