User.destroy_all
Category.destroy_all
Cart.destroy_all
Order.destroy_all
Product.destroy_all
ProductOrder.destroy_all
CartProduct.destroy_all

puts "Creating user..."
user = User.create!(name: "jasmin", email: "jasmin@test.com", password: "verysafepassword")

puts "Creating category..."
category = Category.create!(name: "some category")

puts "Creating cart..."
cart = Cart.create!(user: user)

puts "Creating order..."
order = Order.create!(date: Date.today, user: user)


3.times do
  product = Product.create!(
    name: "some product",
    category: category
  )
  2.times do
    ProductOrder.create!(
      order: order,
      product: product,
      quantity: 3
    )
    CartProduct.create!(
      product: product,
      cart: cart,
      quantity: 4
    )
  end
end