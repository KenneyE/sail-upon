# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


guest = User.create(username: "Guest User", password: "guestpassword")
eric = User.create(username: "Eric", password: "foobar")

interests = {
  "Airplanes" => "If you don't like airplanes, then I don't want to know you.",

  "Animation" => "Like Rugrats and Hey Arnold!",

  "Architecture" => "Buildings go up. Buildings go down. Art.",

  "Art" => "All of the world's finest arts.",

  "Astronomy" => "No telescope? No problem. Explore astronomy, from the Big Bang to the mission to Mars.",

  "Beer" => "Is Oktoberfest your dream vacation? Learn about breweries, craft beers, kegs, beer gardens and more.",

  "Bicycling" => "From fixies to mountain bikes to beach cruisers.",

  "Books" => "Love a good read? Then what the hell are you doing here?",

  "Camping" => "Like the idea of being homeless, but only for a couple days? Then get out there with $3000 worth of gear.",

  "Cars" => "Saving up for a Porsche? Either way, learn about cars, technologies, stunts and more here.",

  "Cigars" => "Put on your smoking jacket and explore cigars: the best international brands, accessories and more.",

  "Cooking" => "Cooking or cookery is the art of preparing food for consumption with the use of heat. Hey Wikipedia, that's pretty neat!",

  "Dogs" => "If you're a cat person then get the hell out. Dog people only beyond this point",

  "Extreme Sports" => "Have ice water running through your veins? Can't get it up unless your on the brink? Are you sick of these rhetorical questions?",

  "Fitness" => "So swoll. Brotein into my veins. Need. More. Reps.",

  "Generally Awesome" => "I don't know how to categorize this stuff. All I know is it's generally pretty awesome.",

  "Graphic Design" => "From logos to websites, graphic designers have perfected the art of visual communication. Check it out.",

  "Making Things" => "Just about people that are really good at making things. Whatever that may be.",

  "Movies" => "Always first in line for the best new movies? Explore the magic of Hollywood and the cinema.",

  "Music" => "Music makes the world go round. Discover new bands, songs, lyrics, music videos and more.",

  "Photography" => "See amazing photos and get photography tips and ideas, from Polaroids to digital cameras.",

  "Photoshop"  => "Bad at taking pictures but want to make people think you're good at it? Too cool for instagram? Perfect recipe for a Photoshop master.",

  "Science"  => "A lot's happened since your first science fair. Learn about discoveries in space, biology and more.",

  "Skiing" => "Love sending it to the moon on a blower day? Love shuttin er down with one big McConkey turn? Love blue bird days with all time pow? Love hanging it out to dry off a dope kicker? Are your Pontoons not wide enough?",

  "Technology" => "Gizmos and gadgets.",

  "Travel" => "See all the world. From the comfort of your desk chair.",

  "Trains" => "Trains are way underrated. Those things are so awesome. Why don't more people think they're awesome?",

  "Video Games" => "So you love no-scoping newbs and crushing Code Red? Love it when a 13 year old calls you a punk bitch? Then come pwn some websites about it."
  }


interest_count = 0
interests.each do |int, desc|
  interest = Interest.create(name: int, description: desc)
  unless (interest_count % 4).zero?
    UserInterest.create(interest_id: interest.id, user_id: guest.id)
  end

  unless (interest_count % 3).zero?
    UserInterest.create(interest_id: interest.id, user_id: eric.id)
  end
  interest_count += 1
end

sites = {
"http://www.archdaily.com/" => ["Architecture"] ,
"http://www.dezeen.com/" => ["Architecture", "Art", "Photograpy"] ,
"http://www.notcot.org/" => ["Architecture", "Art"] ,
"https://www.youtube.com/watch?v=I4r729ZMinQ" => ["Travel", "Photography"] ,
"http://heytherefancypants.com/Photos/CreedmoreLakeNight2.png" => ["Photography"] ,
"http://heytherefancypants.com/Photos/FlatironsFromPlane_2.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/Grays%20Goat.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/Denver%20Day%20-%20Version%203.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/MexicoPinkHouse%20HDR.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/ShopHDR.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/PH_Submarine2.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/CampusLake3.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/FlatironsSnowAndKOBL.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/WindTurbines.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/FarrandField.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/Cactus.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/CampusLake1.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/KissingCouple.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/Luminarias%202.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/SwingAndFlatirons.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/Silos4.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/FlatironsSunSet1.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/Honolulu%20copy.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/kitesurfer.jpg" => ["Photography"] ,
"http://heytherefancypants.com/Photos/SnowTree.jpg" => ["Photography"] ,
"http://www.youtube.com/watch?v=mjJwa2MX4nY" => ["Airplanes"] ,
"https://vimeo.com/27491062" => ["Extreme Sports"] ,
"https://vimeo.com/35204761" => ["Travel", "Extreme Sports", "Movies"] ,
"http://www.youtube.com/watch?v=t3VVx1E1r74" => ["Airplanes", "Science"] ,
"http://heytherefancypants.com/" => ["Photography", "Extreme Sports"] ,
"https://vimeo.com/91496760" => ["Photography", "Extreme Sports", "Movies"] ,
"https://vimeo.com/70573323" => ["Photography", "Generally Awesome", "Movies"] ,
"https://vimeo.com/37870722" => ["Video Games", "Movies" ],
"https://vimeo.com/36768371" => ["Video Games", "Art", "Making Things", "Movies"] ,
"https://vimeo.com/31455885" => ["Making Things", "Movies"] ,
"https://vimeo.com/32113233" => ["Making Things", "Movies"],
"https://vimeo.com/26119425" => ["Camping", "Photography", "Movies"] ,
"https://vimeo.com/17808185" => ["Photography", "Art", "Movies"] ,
"https://vimeo.com/34814788" => ["Art", "Books", "Movies"] ,
"https://vimeo.com/28408829" => ["Making Things", "Movies"] ,
"https://vimeo.com/28454865" => ["Travel", "Movies"] ,
"https://vimeo.com/22894261" => ["Art", "Animation", "Movies"] ,
"https://vimeo.com/26694098" => ["Extreme Sports"] ,
"https://vimeo.com/48153500" => ["Music"] ,
"https://vimeo.com/57634244" => ["Extreme Sports"] ,
"http://livingwood.org/" => ["Art", "Making Things"] ,
"https://vimeo.com/95252357" => ["Making Things", "Movies"] ,
"http://www.musictonic.com" => ["Music"] ,
"http://www.boreme.com/posting.php?id=9425&page=1/" => ["Video Games"] ,
"http://www.io9.com/5893615/absolutely-mindblowing-video-shot-from-the-space-shuttle-during-launch/" => ["Astronomy", "Science", "Generally Awesome", "Technology"] ,
"http://www.gtspirit.com/wp-content/gallery/pagani-huayra-road-test-1/21.jpg/" => ["Cars", "Photography"] ,
"http://www.youtube.com/watch?v=yn3FWb-vQQ4" => [""] ,
"http://aeon.co/magazine/living-together/james-somers-web-developer-money/" => ["Science", "Making Things"] ,
"http://blog.assaflavie.com/touch/" => ["Science"],
"http://www.esquire.com/blogs/car-news/51-coolest-cars-of-the-last-50-years/" => ["Cars"],
"http://www.365tomorrows.com/11/15/the-djinn-effect/" => ["Science"],
"http://www.nikon.com/about/feelnikon/universcale/index_f.htm/" => ["Science", "Photograpy"],
"http://www.flightradar24.com/t_blank/" => ["Airplanes"],
"www.dtelepathy.com/blog/inspiration/beautiful-color-palettes-for-your-next-web-project/" => ["Graphic Design", "Art", "Photoshop"],
"http://www.imgur.com/a/rNPff?gallery/" => ["Movies", "Art", "Graphic Design"],
"www.panoramas.dk/mars/mars-greeleyhaven2/tour.swf/" => ["Astronomy", "Science"],
"www.kitchendaily.com/read/best-burgers-us?ncid=dynaldusaolp00000175/" => ["Cooking"],
"www.neave.com/strobe/" => ["Graphic Design", "Art"],
"www.randyscottslavin.com/data/photos/93_1slavin_photography_8108.jpg/" => ["Photography"],
"http://thoughtcatalog.com/charlie-shaw/2014/05/27-people-share-the-one-cool-internet-or-computer-trick-they-know/" => ["Technology"],
"http://thugkitchen.com/post/51069719327/you-wont-be-stressing-this-summer-if-youre" => ["Cooking"],
"http://www.playbuzz.com/gregs/17-insanely-cool-street-art-you-just-have-to-see/" => ["Art", "Graphic Design", "Generally Awesome"],
"http://on.aol.com/video/airbnb-views-518241779/" => ["Travel"],
"dailypastime.com/if-you-have-an-android-phone-try-these-secret-codes/" => ["Technology"],
"http://hiconsumption.com/2014/05/skylock-smart-bike-lock/" => ["Technology", "Bicycling"],
"inspirationhut.net/inspiration/creative-detailed-typography-greg-coulton/" => ["Art", "Graphic Design"],
"http://ppcdn.500px.org/52866292/9e944f286e9ba110135839dca1aff8a18e18ffe8/2048.jpg" => ["Photography", "Dogs", "Travel"],
"http://goodfil.ms/films/" => ["Movies", "Video Games", "Animation"],
"www.thebuildingblox.com/lee-jae-hyos-amazing-wooden-tables/" => ["Making Things", "Generally Awesome"]
}

sites.each do |url, ints|
  site = Website.create(url: url, title: "Sample Site", submitter_id: 1)

  ints.each do |int|
    int_model = Interest.find_by(name: int)
    unless int_model.nil?
      WebsiteInterest.create(website_id: site.id, interest_id: int_model.id )
    end
  end
end