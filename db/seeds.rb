puts "Seeding..."

bob = User.create(username: "Bob", password: "password", password_confirmation: "password", image_url: "https://upload.wikimedia.org/wikipedia/en/thumb/c/c5/Bob_the_builder.jpg/220px-Bob_the_builder.jpg", bio: "I like to cook stuff")

bob.recipes.create(title: "Soufflé", instructions: "You need to cook the food so that it is done. If you undercook it then it won't be good. Same if you overcook it.", minutes_to_complete: 50)
bob.recipes.create(title: "Cheese", instructions: "Cheese is pretty good. A lot of people like it. Cook it up and you will be happy", minutes_to_complete: 120)

puts "Finished seeding"
