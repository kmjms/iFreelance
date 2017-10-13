# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  Client.create([{
    user: Faker::Name.first_name,
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    totalPayments: Faker::Number.decimal(2, 3),
    lastAccess: Faker::Date.between(2.days.ago, Date.today),
    }])
end

100.times do
  Entity.create([{
    user: Faker::Name.first_name,
    email: Faker::Internet.free_email,
    identifier: Faker::Number.between(1, 100),
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    phone: Faker::PhoneNumber.cell_phone,
    }])
end

100.times do
  Job.create([{
    billNumber: Faker::Number.between(1, 100),
    name: Faker::Name.name,
    price: Faker::Number.decimal(2, 3),
    duration: Faker::Number.between(1, 30),
    state: Faker::Boolean.boolean,
    client_id: Faker::Number.between(1, 100),
    }])
end

100.times do
  JobLog.create([{
    state_code: Faker::Number.between(1, 5),
    message: Faker::Job.title,
    job_id: Faker::Number.between(1, 100),
    }])
end

100.times do
  KindEntity.create([{
    name: Faker::Company.suffix,
    permits: Faker::Number.between(1, 5),
    }])
end

100.times do
  Project.create([{
    name: Faker::App.name,
    modality: Faker::App.name,
    description: Faker::Company.catch_phrase,
    #status: Faker::Boolean.boolean,
    }])
end

100.times do
  Quotation.create([{
    quotationNumber: Faker::Number.between(1, 100),
    price: Faker::Commerce.price,
    duration: Faker::Number.between(1, 30),
    description: Faker::App.name,
    }])
end

100.times do
  TypeJob.create([{
    name: Faker::Job.key_skill,
    skilsRequired: Faker::Number.between(1, 5),
    }])
end
