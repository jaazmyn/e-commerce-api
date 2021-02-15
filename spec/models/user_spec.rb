require 'rails_helper'

require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid name" do
    user = User.new(name: "test", email: "test@test.com")
    expect(user.name).to eq("test")
  end

  it "has a valid email" do
    user = User.new(email: "test@test.com")
    expect(user.email).to eq("test@test.com")
  end
end
