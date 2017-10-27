# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  StateProject.create([{
    name: Faker::Name.title,
    description:Faker::Simpsons.quote
    }])
end

10.times do
  TypeProject.create([{
    name:Faker::Job.field
    }])
end


20.times do
  Client.create([{
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    phone: Faker::Number.number(4)
    }])
end


20.times do
  Freelance.create([{
    name: Faker::Name.name,
    email: Faker::Internet.free_email
    }])
end

##
20.times do
  Project.create([{
    name: Faker::Team.creature,
    description: Faker::Lorem.sentence,
    start_date: Faker::Date.between(2.days.ago, Date.today),
    end_date: Faker::Date.between(2.days.ago, Date.today),
    progress: Faker::Number.decimal(2),
    client_id:rand(1..20),
    freelance_id:rand(1..20),
    state_project_id:rand(1..5),
    type_project_id:rand(1..5)
  }])
end 
