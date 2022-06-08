# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Vehicle.destroy_all
User.destroy_all

user = User.new(first_name: 'bobby', last_name: 'denzel', address: 'Marseille', photo_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3i_qZtrjSgoPCyIOywhlX8MKOzRIaQbKU0A&usqp=CAU')
user.email = 'test@example.com'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.save!

Vehicle.create(name: "Kite", year: "1982", category: "car", description: "Offrez-vous la voiture de la série télévisée K2000. La K.I.T.T", user_id: user.id)
Vehicle.create(name: "Batmobile", year: "2008", category: "car", description: "Offrez-vous la voiture de Batman", user_id: user.id)
Vehicle.create(name: "Ford Gran Torino", year: "1972", category: "car", description: "Offrez-vous la voiture de la série télévisée Starsky & Hutch.", user_id: user.id)
Vehicle.create(name: "Ecto-1", year: "1984", category: "car", description: "Offrez-vous la voiture des GhostBusters. La Ecto-1 !", user_id: user.id)
delorean = Vehicle.new(name: "Delorean", year: "1986", category: "car", description: "Offrez-vous la voiture de Retour vers le Futur. La Delorean !", user_id: user.id)
delorean.save

img1 = URI.open('https://www.autojournal.fr/wp-content/uploads/autojournal/2021/01/delorean_dmc-12_back_to_the_future_5-750x410.jpeg')

img2 = URI.open('https://www.numerama.com/wp-content/uploads/2016/01/delo.jpg')

img3 = URI.open('https://www.tomsguide.fr/content/uploads/sites/2/2020/01/delorean-dmc-12.jpg')

img4 = URI.open('https://delessencedansmesveines.com/wp-content/uploads/2020/12/Z-DLEDMV-Delorean-Turbo-01-1080x675.jpg')

img5 = URI.open('https://www.skillter.com/articles/images/min/delorean.jpg')

photos = [img1, img2, img3, img4, img5]

photos.each_with_index do |photo, index|
  delorean.photos.attach(io: photo, filename: "#{index}.jpeg", content_type: 'image/jpeg')
end

puts "saved"
