require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

shirt = Item.create!(title: "Mithril Shirt", description: "A priceless treasure", price: 1000000.00, image_path: "https://vignette4.wikia.nocookie.net/lotr/images/4/4e/Mithril_Shirt.jpg/revision/latest?cb=20111011153854")
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
guitar = Item.create!(title: "Boromir's Guitar", description: "For when one simply must ROCK into Mordor", price: 500.00, image_path: "http://images.equipboard.com/uploads/item/image/14418/ibanez-mtm100-xl.jpg?v=1492309861")
hair = Item.create!(title: "Legolas' Hair Extensions", description: "You didn't think that was real, did you?", price: 25.00, image_path: "https://s-media-cache-ak0.pinimg.com/originals/f9/0e/00/f90e001e6aeef5d7cecfb0ebe3e76166.jpg")
fish = Item.create!(title: "Gollum's Finest Fish", description: "Really tasty when you've lived in a cave for hundreds of years", price: 1.00, image_path: "http://www.sea-ex.com/fishphotos/images/sea-mullet-pic.jpg")
mushrooms = Item.create!(title: "Home-Grown Mushrooms", description: "A hobbit's favorite food!", price: 2.50, image_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgFdOfCmaF7Ot72FoSujJpZtRsh1A1MeoADuMNndSRjbpYCpv4")
axe = Item.create!(title: "Gimli's Axe", description: "Well, we have all the other weapons, so...", price: 500.00, image_path: "https://shop.royalarmouries.org/images/detailed/1/Battle_Axe_of_Gimli_Movie_Prop_Replica_Lord_of_the_Rings.jpg")
horn = Item.create!(title: "Horn of Gondor", description: "For power-hungry idiots only", price: 100.00, image_path: "http://cdn3.bigcommerce.com/s-s1ldxg/products/37166/images/38019/gondorhorn__89800.1435731224.380.380.jpg?c=2")
cloak = Item.create!(title: "Ringwraith Cloak", description: "One size fits air", price: 100.00, image_path: "https://s-media-cache-ak0.pinimg.com/originals/bd/3c/94/bd3c94924f15ff5c164ec1c64f1f2870.jpg")
potatoes = Item.create!(title: "PO-TA-TOES", description: "Boil 'em, mash 'em, stick 'em in a stew", price: 3.500, image_path: "https://s-media-cache-ak0.pinimg.com/736x/e7/e1/6f/e7e16f834329f767c6ef9f1b2230fc1a--be-real-stew.jpg")
army = Item.create!(title: "Aragorn's Ghost Army - 1 Hour", description: "They still owe him", price: 450.00, image_path: "https://vignette2.wikia.nocookie.net/lotr/images/8/8b/Aragorn-Dead_army.jpg/revision/latest?cb=20130319232933")
mud = Item.create!(title: "Orc Mud", description: "For making nice orcses, yes", price: 1.00, image_path: "https://vignette4.wikia.nocookie.net/lotr/images/3/30/1auruk-hai.jpg/revision/latest/scale-to-width-down/230?cb=20110607170014")



elven_ware = Category.create!(title: "Elven Ware")
journeying = Category.create!(title: "Journeying And War")
home_hearth = Category.create!(title: "Home And Hearth")
pure_evil = Category.create!(title: "Pure Evil")

elven_ware.items << [rope, bread, sting, anduril, shirt, hair]
journeying.items << [shirt, bread, rope, pony, pipe, shadowfax, guitar, axe, sting, anduril, horn, army]
home_hearth.items << [rope, bread, pony, door, pipe, guitar, hair, fish, mushrooms, potatoes]
pure_evil.items << [palantir, ring, cloak, mud]
