
=begin
User.destroy_all
jorge = User.create(admin: true, sex: "Homme", email: "jorge.ruivinho@me.com", password: "password", pseudo: "Jrui7", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1518690464/n5jdovwupist569mxi1r.jpg")
jennifer = User.create(sex: "Femme", email: "jenniferschwientek@gmail.com", password: "password", pseudo: "Jenny", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1504809025/pfzlmedhzlieyalaczxr.jpg")
thomas = User.create(sex: "Homme", email: "studentouch@gmail.com", password: "password", pseudo: "SurfMousse", photo_url: "http://res.cloudinary.com/dlddnk3pr/image/upload/v1505133796/sgb463x8acjlumv7ht86.jpg")

puts "Users created !"
puts "--------------------"




=end

Category.destroy_all

mode = Category.create(name: "Mode")
beauté = Category.create(name: "Beauté")
sport = Category.create(name: "Sport")
tech = Category.create(name: "Tech")
loisir = Category.create(name: "Loisirs & Sorties")
maison = Category.create(name: "Maison")
enfants = Category.create(name: "Enfants")
animaux = Category.create(name: "Animaux")
puts "Categories created !"
puts "--------------------"

# mode = Category.where(name: "Mode & Beauté").first
# sport = Category.where(name: "Sport").first
# tech = Category.where(name: "Tech").first
# loisir = Category.where(name: "Loisirs & Sorties").first
# maison = Category.where(name: "Maison").first
# enfants = Category.where(name: "Enfants").first
# animaux = Category.where(name: "Animaux").first



jorge = User.first
thomas = User.where(pseudo: "SurfMousse").first
jenny = User.where(pseudo: "Jenny").first



# j = Address.create(user_id: jorge.id, first_name: "Jorge", last_name: "Ruivinho", street: "64 rue de la Pompe", zip_code: "75116", city: "Paris")
# t = Address.create(user_id: thomas.id, first_name: "Thomas", last_name: "Caillol" street: "1 rue de la falaise", zip_code: "13000", city: "Marseille")

# puts "Addreses created !"
# puts "--------------------"

Seed.destroy_all

seed_mode = Seed.create(status: "published", expedition_costs: 3.1,sale_point_url:"https://medium.com/", size_guide: "https://www.monsieurtshirt.com/informations/8-guide-des-tailles", popularity: 0, view_counter: 0, url: "https://www.youtube.com/watch?v=5AhY_-qUb4w" , title: "T-shirt Psycha", expiration: DateTime.now.utc + 3.days, user_id: thomas.id, category_id: mode.id, description: "Avec ça Men, tu peux même parler boulot après 19h00", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1509956287/hdecr3jxijppwsukhi0l.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1509623265/ridfuoa67vz6ewlb3zop.jpg"])
seed_sport  = Seed.create(sale_point_url:"https://medium.com/", url: "https://www.youtube.com/watch?v=5AhY_-qUb4w" , title: "Le tube d'Hendaye", expiration: DateTime.now.utc + 3.days, user_id: thomas.id, category_id: sport.id, description: "Perso Ma Men, c'est les plus grosses vagues que j'ai ridé", photo_urls: ["http://res.cloudinary.com/dlddnk3pr/image/upload/v1505138572/eecindhnvh2ltpxpitb9.jpg", "http://res.cloudinary.com/dlddnk3pr/image/upload/v1509956287/hdecr3jxijppwsukhi0l.jpg"])
seed_tech = Seed.create(sale_point_url:"https://medium.com/", url: "https://www.youtube.com/watch?v=XkA6UAfmJjc" , title: "Pour être beau comme un prince", expiration: DateTime.now.utc + 2.days, user_id: jorge.id, category_id: tech.id, description: "C'est l'astuce pour transformer n'importe qui en super-model", photo_urls: ["https://res.cloudinary.com/dlddnk3pr/image/upload/v1524054169/qaipq2zf5uknphrjkmwr.jpg", "https://res.cloudinary.com/dlddnk3pr/image/upload/v1530633794/iavzrxuu1k1uujyac5yu.jpg"])
seed_loisir = Seed.create( sale_point_url:"https://medium.com/", url: "https://www.youtube.com/watch?v=XkA6UAfmJjc" , title: "La balle fusion", expiration: DateTime.now.utc + 2.days, user_id: jorge.id, category_id: loisir.id, description: "Ca file au vent, pénétration idéale", photo_urls: ["https://res.cloudinary.com/dlddnk3pr/image/upload/v1515594231/yofohoglkkmg7fulltdz.jpg", "https://res.cloudinary.com/dlddnk3pr/image/upload/v1520011589/souhaiter_h0suob.jpg"])
seed_maison = Seed.create(sale_point_url:"https://medium.com/", url: "https://www.youtube.com/watch?v=KNuUGEahHg8" , title: "L'oeuvre d'art des artistes", expiration: DateTime.now.utc + 4.days, user_id: jenny.id, category_id: maison.id, description: "Franchement, je paye direct, c'est top", photo_urls: ["https://res.cloudinary.com/dlddnk3pr/image/upload/v1515169961/p0s2yb8slkhbymzkwffq.jpg", "https://res.cloudinary.com/dlddnk3pr/image/upload/v1515327632/ctmwsunpxm7jc3jsxjfi.jpg"])
seed_enfants = Seed.create(sale_point_url:"https://medium.com/", url: "https://www.youtube.com/watch?v=VHYUjNh0T1w" , title: "Meilleure table vegan de Los Angeles", expiration: DateTime.now.utc + 4.days, user_id: jenny.id, category_id:enfants.id, description: "Avec des plats comme ceux-ci, plus d'excuse pour ne pas tenter de changer son alimentation", photo_urls: ["https://res.cloudinary.com/dlddnk3pr/image/upload/v1513340841/q3ucenoiinalu6pm48j7.jpg", "https://res.cloudinary.com/dlddnk3pr/image/upload/v1515169634/rm5jkosnozeic6skltas.jpg"])
seed_animaux = Seed.create(sale_point_url:"https://medium.com/", url: "https://www.youtube.com/watch?v=VHYUjNh0T1w" , title: "Test si ça marche", expiration: DateTime.now.utc + 1.minutes, user_id: jenny.id, category_id: animaux.id, description: "Avec des plats comme ceux-ci, plus d'excuse pour ne pas tenter de changer son alimentation", photo_urls: [ "https://res.cloudinary.com/dlddnk3pr/image/upload/v1513088625/kl46egceubud3v1i7c3o.jpg", "https://res.cloudinary.com/dlddnk3pr/image/upload/v1513262975/geyj1lkquqx6i08dx8j1.png"])

puts "Seed created"
puts "----------------------"

campaign1 = Campaign.create(seed_id: seed_mode.id)

puts "Campaigns created"
puts "-----------------------"

