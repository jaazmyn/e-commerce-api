# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.create!(name: "some category") }

  it "has a name" do
    expect(category.name).to eq("some category")
  end

  it "has many products" do
    expect(category).to respond_to(:products)
  end
end
