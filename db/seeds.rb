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
amber = User.create(email: "amber@mindful.com", password: "secret")
elisabeth = User.create(email: "eli@mindful.com", password: "secret")
eleanore = User.create(email: "eleanore@mindful.com", password: "secret")

ester_profile = Profile.create(first_name: "Ester", last_name: "Moon", bio: "Hello!? Is it me you're looking for?", user: ester )
amber_profile = Profile.create(first_name: "Amber", last_name: "Wind", bio: "Hello!? I've been wondering if after all these years you'd like to meet?", user: amber )
elisabeth_profile = Profile.create(first_name: "Elisabeth", last_name: "Sun", bio: "Hello from the other side!", user: elisabeth )
eleanore_profile = Profile.create(first_name: "Eleanore", last_name: "Swiftarrow", bio: "Hello from the outside!", user: eleanore )


profilephoto_ester = ProfilePhoto.create(remote_image_url: "http://res.cloudinary.com/dfc7k24vb/image/upload/v1480584013/mindful-living/moonmoon.jpg", profile: ester_profile)
profilephoto_amber = ProfilePhoto.create(remote_image_url: "http://res.cloudinary.com/dfc7k24vb/image/upload/v1480857227/amber_c10rsk.jpg", profile: amber_profile)
profilephoto_elisabeth = ProfilePhoto.create(remote_image_url: "http://res.cloudinary.com/dfc7k24vb/image/upload/v1480857227/elisabeth_bb1evw.jpg", profile: elisabeth_profile)
profilephoto_eleanore = ProfilePhoto.create(remote_image_url: "http://res.cloudinary.com/dfc7k24vb/image/upload/v1480857228/eleanore_kuoaxb.jpg", profile: eleanore_profile)

powerofnow_ester = Product.create(name: "The Power of Now", description: "The best book ever!", user: ester)
newearth_ester = Product.create(name: "The New Earth", description: "Continuation of Power of Now.", user: ester)
mindfulness_ester = Product.create(name: "Mindfulness Guide", description: "Finding peace in a franctic world.", user: ester)

productphoto_powerofnow = ProductPhoto.create(remote_image_url: "http://res.cloudinary.com/dfc7k24vb/image/upload/v1480856117/thePowerOfNow_yzbx9u.jpg", product: powerofnow_ester)
productphoto_newearth = ProductPhoto.create(remote_image_url: "http://res.cloudinary.com/dfc7k24vb/image/upload/v1480693871/qxss1up34q1f3mtrkwxo.jpg", product: newearth_ester)
productphoto_mindfulness = ProductPhoto.create(remote_image_url: "http://res.cloudinary.com/dfc7k24vb/image/upload/v1480856327/franticworld_esxhuw.jpg", product: mindfulness_ester)
