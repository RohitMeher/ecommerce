# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "admin@ecommerce.com", first_name: "Admin", last_name: "User", password: "Admin@user", is_admin: true)
Product.create(title: "Shoes", code: "SH01", quantity: 15, price: 100, description1: "XYZ brand", description2: "Running Shoes")
Product.create(title: "Shoes", code: "SH02", quantity: 15, price: 75, description1: "XYZ brand", description2: "Casual Shoes")
Product.create(title: "Shirts", code: "SR01", quantity: 15, price: 200, description1: "XYZ brand", description2: "Informal shirts")
Product.create(title: "Shirts", code: "SR02", quantity: 15, price: 150, description1: "XYZ brand", description2: "Formal shirts")
Product.create(title: "Watches", code: "W01", quantity: 15, price: 50, description1: "XYZ brand", description2: "Analog Watches")
Product.create(title: "Watches", code: "W02", quantity: 15, price: 75, description1: "XYZ brand", description2: "Digital Watches")

