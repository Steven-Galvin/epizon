User.destroy_all
Product.destroy_all

20.times do |i|
  Product.create!(name: Faker::Lorem.word,
                  price: rand(10...100),
                  description: Faker::Lorem.sentence(5, false, 0).chop)
end

User.create!(name: "Admin",
            email: "admin@admin.com",
            password: "asdfas",
            password_confirmation: "asdfas",
            admin: true
)

User.create!(name: "User 1",
            email: "user1@user1.com",
            password: "asdfas",
            password_confirmation: "asdfas",
            admin: false
)

User.create!(name: "User 2",
            email: "user2@user2.com",
            password: "asdfas",
            password_confirmation: "asdfas",
            admin: false
)


p "Created #{User.count} users"
p "Created #{Product.count} products"
