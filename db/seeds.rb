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

user = User.new(first_name: 'bobby', last_name: 'denzel', address: 'Marseille')
user.email = 'test@example.com'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.save!
img_user = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwM5T40YEBEnWQvgQb8tGAMb1FrECSLdcRSQ&usqp=CAU')
user.photo.attach(io: img_user, filename: "1.jpeg", content_type: 'image/jpeg')

delorean = Vehicle.new(name: "Delorean", year: "1986", category: "car", description: "Rent the famous car from Back To The Future, the Delorean !", user_id: user.id)
delorean.save
kitt = Vehicle.new(name: "Kitt", year: "1982", category: "car", description: "Rent the famous car from the TV show Knight Rider, K.I.T.T", user_id: user.id)
kitt.save
batmobile = Vehicle.new(name: "Batmobile", year: "2008", category: "car", description: "Rent the fantastic Batmobile from The Dark Knight movie", user_id: user.id)
batmobile.save
torino = Vehicle.new(name: "Ford Gran Torino", year: "1972", category: "car", description: "Rent the famous Gran Torino from the TV show Starsky & Hutch", user_id: user.id)
torino.save
ecto = Vehicle.new(name: "Ecto-1", year: "1984", category: "car", description: "Rent the iconic GhostBusters car, the Ecto-1 !", user_id: user.id)
ecto.save
tonnerre = Vehicle.new(name: "Tonnerre Mécanique", year: "1985", category: "motorbike", description: "Offrez-vous la moto de la série Tonnerre Mécanique", user_id: user.id)
tonnerre.save

img1 = URI.open('https://www.autojournal.fr/wp-content/uploads/autojournal/2021/01/delorean_dmc-12_back_to_the_future_5-750x410.jpeg')

img2 = URI.open('https://www.numerama.com/wp-content/uploads/2016/01/delo.jpg')

img3 = URI.open('https://www.tomsguide.fr/content/uploads/sites/2/2020/01/delorean-dmc-12.jpg')

img4 = URI.open('https://delessencedansmesveines.com/wp-content/uploads/2020/12/Z-DLEDMV-Delorean-Turbo-01-1080x675.jpg')

img5 = URI.open('https://www.skillter.com/articles/images/min/delorean.jpg')

photos = [img1, img2, img3, img4, img5]

photos.each_with_index do |photo, index|
  delorean.photos.attach(io: photo, filename: "#{index}.jpeg", content_type: 'image/jpeg')
end

img1_kitt = URI.open('https://www.turbo.fr/sites/default/files/2019-11/IMG_9420.jpg')

img2_kitt = URI.open('https://upload.wikimedia.org/wikipedia/commons/2/20/Knight2000_ex107.jpg')

img3_kitt = URI.open('https://photos.tf1.fr/1200/720/k2000-d9d013-0@1x.jpg')

img4_kitt = URI.open('https://www.voiture-de-film.fr/wp-content/uploads/trans-am-k2000-750x375.jpg')

img5_kitt = URI.open('https://delessencedansmesveines.com/wp-content/uploads/2019/03/DLEDMV-2K19-K-2000-KITT-005.jpg')

photos_kitt = [img1_kitt, img2_kitt, img3_kitt, img4_kitt, img5_kitt]

photos_kitt.each_with_index do |photo, index|
  kitt.photos.attach(io: photo, filename: "#{index}.jpeg", content_type: 'image/jpeg')
end

img1_bat = URI.open('https://sportauto.autojournal.fr/wp-content/uploads/sportauto/2022/03/batmobile_the_tumbler_7-562x410.jpeg')

img2_bat = URI.open('https://www.tomsguide.fr/content/uploads/sites/2/2020/05/batmobile-dark-knight.jpg')

img3_bat = URI.open('https://p5.storage.canalblog.com/56/45/235515/14188774.jpg')

img4_bat = URI.open('https://img4.autodeclics.com/11/2022/02/photo_article/105061/43220/800-L-la-batmobile-passe-llectrique-un-modle-disponible-lachat.jpg')

img5_bat = URI.open('https://cimg1.ibsrv.net/ibimg/hgm/800x450-1/100/357/tumbler-batmobile_100357173.jpg')

photos_bat = [img1_bat, img2_bat, img3_bat, img4_bat, img5_bat]

photos_bat.each_with_index do |photo, index|
  batmobile.photos.attach(io: photo, filename: "#{index}.jpeg", content_type: 'image/jpeg')
end

img1_torino = URI.open('https://www.lrm-collection.fr/Photo_big_Ford_Torino-starsky-et-hutch_1975_6986_1.jpg')

img2_torino = URI.open('https://i.ytimg.com/vi/-R8mYiLM_Hs/maxresdefault.jpg')

img3_torino = URI.open('https://france3-regions.francetvinfo.fr/image/N-swUwv078dpi9ac7LVk5HTfzyg/1200x675/regions/2020/06/09/5edf18280d77c_14372436_1271623726221894_1254427613604660643_o.jpg')

img4_torino = URI.open('https://images.caradisiac.com/logos/1/9/8/3/241983/S8-photos-du-jour-ford-gran-torino-traversee-de-paris-162990.jpg')

img5_torino = URI.open('https://www.motorlegend.com/occasion-voiture/photos/med/ford-usa-occasion-107834-1.jpg')

photos_torino = [img1_torino, img2_torino, img3_torino, img4_torino, img5_torino]

photos_torino.each_with_index do |photo, index|
  torino.photos.attach(io: photo, filename: "#{index}.jpeg", content_type: 'image/jpeg')
end

img1_ecto = URI.open('https://static.turbosquid.com/Preview/2019/10/17__12_55_47/1.jpeg70750952-4F0D-456E-9D47-2F63DFB95CB7Large.jpg')

img2_ecto = URI.open('https://img4.autodeclics.com/photo_article/103047/41437/1200-L-pourquoi-les-prix-de-la-voiture-mythique-de-ghostbusters-explosent.jpg')

img3_ecto = URI.open('https://www.largus.fr/images/images/ecto1-avd.jpg')

img4_ecto = URI.open('https://m.media-amazon.com/images/I/51RU3stiKIL._AC_SX425_.jpg')

img5_ecto = URI.open('https://i.etsystatic.com/12395705/r/il/b07c58/1324424943/il_570xN.1324424943_2gbk.jpg')

photos_ecto = [img1_ecto, img2_ecto, img3_ecto, img4_ecto, img5_ecto]

photos_ecto.each_with_index do |photo, index|
  ecto.photos.attach(io: photo, filename: "#{index}.jpeg", content_type: 'image/jpeg')
end

img1_tonnerre = URI.open('https://www.leguidevert.com/_lgv/img_forum/2007/07/a33609.jpg')

img2_tonnerre = URI.open('https://images.cults3d.com/V5zbURzAvqcNQ5bNzw6t68oixd4=/https://files.cults3d.com/uploaders/13437418/illustration-file/fbb6d69e-0ab9-413e-b77c-22c82baede65/IMG_5026.JPG')

img3_tonnerre = URI.open('http://osibo-news.com/wp-content/uploads/2014/04/114.jpg')

img4_tonnerre = URI.open('https://www.cryptoseries.fr/media/k2/items/cache/3182b2a6002d7c6eae45301adb4cf349_XL.jpg')

img5_tonnerre = URI.open('http://www.topkool.com/fr/wp-content/uploads/2012/08/tonnerre-mecanique-010.jpg')

photos_tonnerre = [img1_tonnerre, img2_tonnerre, img3_tonnerre, img4_tonnerre, img5_tonnerre]

photos_tonnerre.each_with_index do |photo, index|
  tonnerre.photos.attach(io: photo, filename: "#{index}.jpeg", content_type: 'image/jpeg')
end

puts "saved"
