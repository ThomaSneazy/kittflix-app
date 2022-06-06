# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vehicle.destroy_all
Vehicle.create(name: "Kite", year: "1982", category: "car", description: "Offrez-vous la voiture de la série télévisée K2000. La K.I.T.T")
Vehicle.create(name: "Batmobile", year: "2008", category: "car", description: "Offrez-vous la voiture de Batman")
Vehicle.create(name: "Ford Gran Torino", year: "1972", category: "car", description: "Offrez-vous la voiture de la série télévisée Starsky & Hutch.")
Vehicle.create(name: "Ecto-1", year: "1984", category: "car", description: "Offrez-vous la voiture des GhostBusters. La Ecto-1 !")
