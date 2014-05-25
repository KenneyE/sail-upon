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
  "Photography" => "See amazing photos and get photography tips and ideas, from Polaroids to digital cameras.",

  "Science"  => "A lot's happened since your first science fair. Learn about discoveries in space, biology and more.",

  "Art" => "All of the world's finest arts.",

  "Skiing" => "Love snow days? From the mountains of Colorado to Vermont, explore downhill and cross country skiing.",

  "Astronomy" => "No telescope? No problem. Explore astronomy, from the Big Bang to the mission to Mars.",

  "Movies" => "Always first in line for the best new movies? Explore the magic of Hollywood and the cinema.",

  "Beer" => "Is Oktoberfest your dream vacation? Learn about breweries, craft beers, kegs, beer gardens and more.",

  "Cigars" => "Put on your smoking jacket and explore cigars: the best international brands, accessories and more.",

  "Cars" => "Saving up for a Porsche? Either way, learn about cars, technologies, stunts and more here.",

  "Cooking" => "Cooking or cookery is the art of preparing food for consumption with the use of heat. Hey Wikipedia, that's pretty neat!",

  "Graphic Design" => "From logos to websites, graphic designers have perfected the art of visual communication. Check it out.",

  "Music" => "Music makes the world go round. Discover new bands, songs, lyrics, music videos and more.",

  "Camping" => "Love the great outdoors? Explore hiking, camping and adventure sports. And then get out there!",

  "Trains" => "Was Thomas the Tank Engine your favorite toy? Explore the history of trains, railway modelling and more.",

  "Video Games" => "So you love no-scoping newbs and crushing Code Red? Love it when a 13 year old calls you a punk bitch? Then come pwn some websites about it.",

  "Fitness" => "So swoll. Brotein into my veins. Need. More. Reps.",

  "Books" => "Love a good read? Then what the hell are you doing here?",

  "Animation" => "Like Rugrats and Hey Arnold!",

  "Architecture" => "Buildings go up. Buildings go down. Art.",

  "Travel" => "See all the world. From the comfort of your desk chair.",

  "Airplanes" => "If you don't like airplanes, then I don't want to know you.",

  "Extreme Sports" => "Love shredding gnar and chasing swells?",

  "Photoshop"  => "Bad at taking pictures but want to make people think you're good at it? Too cool for instagram? Perfect recipe for a Photoshop master.",

  "Generally Awesome" => "I don't know how to categorize this stuff. All I know is it's generally pretty awesome.",

  "Making Things" => "Just about people that are really good at making things. Whatever that may be."}


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
"http://vimeo.com/user2667979/borddemer1" => ["Animation", "Movies"] ,
"http://livingwood.org/" => ["Art", "Making Things"] ,
"https://vimeo.com/95252357" => ["Making Things", "Movies"] ,
"http://www.musictonic.com" => ["Music"] ,
"http://www.boreme.com/posting.php?id=9425&page=1/" => ["Video Games"] ,
"http://www.io9.com/5893615/absolutely-mindblowing-video-shot-from-the-space-shuttle-during-launch/" => ["Astronomy", "Science", "Generally Awesome"] ,
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
"www.psykopaint.com/painter.html/" => ["Photography", "Art", "Photoshop", "Animation" ],
"www.neave.com/strobe/" => ["Graphic Design", "Art"],
"http://pdl.vimeocdn.com/50060/622/240516411.mp4?token2=1400980890_6dd6edd6d371612426ef6ef662903d5a&aksessionid=da4361ee5d8d295f" => ["Music"],
"www.randyscottslavin.com/data/photos/93_1slavin_photography_8108.jpg/" => ["Photography"]
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