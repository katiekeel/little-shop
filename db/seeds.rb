require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

shirt = Item.create!(title: "Frodo's Mithril Shirt", description: "A priceless treasure", price: 1000000.00, image_path: "https://vignette4.wikia.nocookie.net/lotr/images/4/4e/Mithril_Shirt.jpg/revision/latest?cb=20111011153854")
rope = Item.create!(title: "Sam's Elven Rope", description: "A gift from Lady Galadriel", price: 27.50, image_path: "http://www.homedepot.com/catalog/productImages/1000/99/998af034-05b7-4a04-87c5-5307830cc1d9_1000.jpg")
bread = Item.create!(title: "Waybread", description: "Elven bread to give you strength", price: 5.00, image_path: "http://cdn-us-cf.yottaa.net/5756da51312e5864f800023d/blog.kingarthurflour.com/v~13.40/wp-content/uploads/2016/08/Stenciling-21.jpg?yocs=1_&yoloc=us")
palantir = Item.create!(title: "Palantir", description: "Saruman's crystal ball connection with Sauron", price: 750000.00, image_path: "https://www.fantasyflightgames.com/media/ffg_content/LOTR%20Confrontation/KN22-art-palantir.jpg")
pipe = Item.create!(title: "Gandalf's Pipe", description: "Only the finest pipe-weed in here", price: 150.00, image_path: "http://www.thinkgeek.com/images/products/additional/large/154d_hobbit_gandalf_pipe_prop_replica_bilbo.jpg")
pony = Item.create!(title: "Bill the Pony", description: "Stolen from the bad guy in Bree", price: 2000.00, image_path: "https://wherewindowsmeet.files.wordpress.com/2013/03/shetland_pony_on_belstone_common_dartmoor.jpg")
sting = Item.create!(title: "Sting", description: "The orc-detecting sword", price: 10000.00, image_path: "http://www.darkknightarmoury.com/images/Product/large/LOTR-02.png")
anduril = Item.create!(title: "Anduril", description: "Only the heir of Elendil may wield it", price: 500000.00, image_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiM4nU25HRNZSQUYZQIA5TCq0uIy_2WJ3LFzwdIewAcCvTRRZsgQ")
door = Item.create!(title: "Hobbit-Hole Door", description: "A fine home entrance", price: 350.00, image_path: "https://s-media-cache-ak0.pinimg.com/736x/97/a5/f6/97a5f6329b3f8fc4ee7978a6c101a229--hobbit-house-interior-hobbit-door.jpg")
ring = Item.create!(title: "The Ring", description: "Your very own precious! What a bargain", price: 1000000000000.00, image_path: "https://i.ytimg.com/vi/ZLjKYj0NWmM/maxresdefault.jpg")
shadowfax = Item.create!(title: "Shadowfax", description: "King of the horses of Rohan", price: 10000.00, image_path: "http://images2.fanpop.com/image/photos/14000000/Shadowfax-shadowfax-14039546-600-714.jpg")

elven_ware = Category.create!(title: "Elven Ware")
journeying = Category.create!(title: "Journeying")
home_hearth = Category.create!(title: "Home And Hearth")
pure_evil = Category.create!(title: "Pure Evil")

elven_ware.items << [rope, bread, sting, anduril, shirt]
journeying.items << [shirt, bread, rope, pony, pipe, shadowfax]
home_hearth.items << [rope, bread, pony, door, pipe]
pure_evil.items << [palantir, ring]
