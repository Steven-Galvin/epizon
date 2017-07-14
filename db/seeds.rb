class Seed
  User.destroy_all
  Product.destroy_all

  def self.begin
    seed = Seed.new
    seed.generate_products
  end

  def generate_products
    20.times do |i|
      Product.create!(name: Faker::Lorem.word,
                      price: rand(10...100),
                      description: Faker::Lorem.sentence(5, false, 0).chop)
    end
  end
end

Seed.begin
