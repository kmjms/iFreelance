# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  Client.create([{
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    phone: Faker::Number.number(4),
    total_payment: Faker::Number.decimal(2, 3),
    }])
end

20.times do
  Project.create([{
    name_project: Faker::Team.creature,
    description: Faker::Lorem.sentence,
    star_date: Faker::Date.between(2.days.ago, Date.today),
    end_date: Faker::Date.between(2.days.ago, Date.today),
    name_client: Faker::Name.name,
    state_project: Faker::Team.state,
    price: Faker::Number.decimal(2, 3),
    progress: Faker::Number.decimal(2),
   }])
end
