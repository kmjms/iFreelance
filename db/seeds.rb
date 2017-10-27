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

for i in 1..20
  currentUser = User.create([{
    email: Faker::Internet.free_email,
    password:Faker::Number.number(6)
  }])
  Freelance.create([{
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    user_id:i
  }])
end

## Creacion de usuario de prueba
currUser = User.create(email:"user@test.com",password:"123456")
myFreelance = Freelance.create({
  name: 'Test freelance',
  email: 'user@test.com',
  user_id:currUser.id
})

8.times do
  myFreelance.clients << Client.find(rand(1..20))
  myFreelance.save
end


## XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxxx

10.times do
  currentFreelance = Freelance.find(rand(1..20))

  rand(1..6).times do
    
    currentFreelance.clients << Client.find(rand(1..20))
    currentFreelance.save
  end
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

50.times do
  Income.create([{
    price: Faker::Number.decimal(2, 3),
    description: Faker::Simpsons.quote,
    project_id:rand(1..20)
    }])
end

# agregar proyectos random al usuario

for i in 21..35

    Project.create([{
      name: Faker::Team.creature,
      description: Faker::Lorem.sentence,
      start_date: Faker::Date.between(2.days.ago, Date.today),
      end_date: Faker::Date.between(2.days.ago, Date.today),
      progress: Faker::Number.decimal(2),
      client_id:rand(1..20),
      freelance_id:myFreelance.id,
      state_project_id:rand(1..5),
      type_project_id:rand(1..5)
    }])

    rand(4..9).times do
      Income.create([{
        price: Faker::Number.decimal(2, 3),
        description: Faker::Simpsons.quote,
        project_id:i
    }])
    end
    
end






