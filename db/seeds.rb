# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
include Faker

5000.times do 
	Product.create(
		product_type: "Mobile",
		product_name: Faker::Device.model_name,
		model: Faker::Device.version,
		brand: Faker::Device.manufacturer,
		year: Faker::Number.within(1990..2019),
		ram: Faker::Number.between(1, 10),
		internal_storage: Faker::Number.between(2,200),
		external_storage: Faker::Number.between(2,200)
	)
end
