# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
C1 = Category.create(title: "Entree",
                     description: "Home made food ready to eat")

C2 = Category.create(title: "Desserts",
                     description: "Finger-licking desserts")
Menu.delete_all
F1 = Menu.create(title: "Spagetti bolognese",
                 description: "Yummy spagetti to increase your life span!",
                 price: 1.5
                 )

F2 = Menu.create(title: "Steaks",
                 description: "Nice mix of african special barbecue sauce",
                 price: 2.50
                 )

F3 = Menu.create(title: "Lobsters",
                 description: "Crispy sea food delicacy to make your holiday",
                 price: 3.25)
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

C1.menus << F1
C1.menus << F2
C2.menus << F3


                     
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')