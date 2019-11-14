# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

people_seed=[
    {
        name: "Johnny Cash",
        identity: "555555555",
        birthdate: "26 de fevereiro de 1932",
    },

    {
        name: "Sid Vicious",
        identity: "555555555",
        birthdate: "10 de maio de 1957",
    },
    {
        name: "Axl Rose",
        identity: "555555555",
        birthdate: "6 de fevereiro de 1962",
    },
    {
        name: "Joey Ramone",
        identity: "555555555",
        birthdate: "19 de maio de 1951",
    },
    {
        name: "Bruce Dickinson",
        identity: "555555555",
        birthdate: "7 de agosto de 1958",
    },
    {
        name: "Kurt Cobain",
        identity: "555555555",
        birthdate: "20 de fevereiro de 1967",
    },
    {
        name: "Elvis Presley",
        identity: "555555555",
        birthdate: "17 de agosto de 2008",
    },

]
people_seed.each do |person|
  Person.create(name: person[:name],
                identity: person[:identity],
                birthdate: person[:birthdate]
  )
end

animals_seed=[
    {
        name: "Pé de Pano",
        mensal_cost: "199,99",
        animal_type: "Cavalo",
        owner_name: "Johnny Cash",
    },
    {
        name: "Rex",
        mensal_cost: "99,99",
        animal_type: "Cachorro",
        owner_name: "Sid Vicious",
    },
    {
        name: "Ajudante do Papai Noel",
        mensal_cost: "99,99",
        animal_type: "Cachorro",
        owner_name: "Axl Rose",
    },
    {
        name: "Rex",
        mensal_cost: "103,99",
        animal_type: "Papagaio",
        owner_name: "Joey Ramone",
    },
    {
        name: "Flora",
        mensal_cost: "103,99",
        animal_type: "Lhama",
        owner_name: "Bruce Dickinson",
    },
    {
        name: "Dino",
        mensal_cost: "177,99",
        animal_type: "Iguana",
        owner_name: "Kurt Cobain",
    },
    {
        name: "Lassie",
        mensal_cost: "407,99",
        animal_type: "Ornitorrinco",
        owner_name: "Elvis Presley",
    }
]

animals_seed.each do |animal|
  Animal.create(name: animal[:name],
                mensal_cost: animal[:mensal_cost],
                animal_type: animal[:animal_type],
                owner: Person.find_by(name:animal[:owner_name])
  )
end