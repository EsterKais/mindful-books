# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProductPhoto.delete_all
ProfilePhoto.delete_all
Product.delete_all
Profile.delete_all
User.delete_all

ester = User.create(email: "ester@mindful.com", password: "secret")

ester_profile = Profile.create(first_name: "Ester", last_name: "Moon", bio: "Hello!? Is it me you're looking for?", user: ester )

profilephoto_ester = ProfilePhoto.create(remote_image_url: "http://res.cloudinary.com/dfc7k24vb/image/upload/v1480584013/mindful-living/moonmoon.jpg", profile: ester_profile)

powerofnow_ester = Product.create(name: "The Power of Now", description: "The best book ever!", user: ester)
newearth_ester = Product.create(name: "The New Earth", description: "Continuation of Power of Now", user: ester)

productphoto_powerofnow = ProductPhoto.create(remote_image_url: "http://res.cloudinary.com/dfc7k24vb/image/upload/v1480693852/bkzhuat9cufjdud6qgcr.jpg", product: powerofnow_ester)
productphoto_newearth = ProductPhoto.create(remote_image_url: "http://res.cloudinary.com/dfc7k24vb/image/upload/v1480693871/qxss1up34q1f3mtrkwxo.jpg", product: newearth_ester)
