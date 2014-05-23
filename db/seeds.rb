# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(username: "Guest User", password: "password")
User.create(username: "Eric", password: "foobar")

interests = {
  "Photograpy" => "See amazing photos and get photography tips and ideas, from Polaroids to digital cameras.",
  "Science"  => "A lot's happened since your first science fair. Learn about discoveries in space, biology and more.",
  "Art" => "All of the world's finest arts.",
  "Skiing" => "Love snow days? From the mountains of Colorado to Vermont, explore downhill and cross country skiing.",
  "Astronomy" => "No telescope? No problem. Explore astronomy, from the Big Bang to the mission to Mars.",
  "Movies" => "Always first in line for the best new movies? Explore the magic of Hollywood and the cinema.",
  "Beer" => "Is Oktoberfest your dream vacation? Learn about breweries, craft beers, kegs, beer gardens and more.",
  "Cigars" => "Put on your smoking jacket and explore cigars: the best international brands, accessories and more.",
  "Cars" => "Saving up for a Porsche? Either way, learn about cars, technologies, stunts and more here.",
  "Cooking" => "",
  "Food" => "",
  "Graphic Design" => "From logos to websites, graphic designers have perfected the art of visual communication. Check it out.",
  "Music" => "Music makes the world go round. Discover new bands, songs, lyrics, music videos and more.",
  "Camping" => "Love the great outdoors? Explore hiking, camping and adventure sports. And then get out there!",
  "Trains" => "Was Thomas the Tank Engine your favorite toy? Explore the history of trains, railway modelling and more.",
  "Video Games" => "",
  "Fitness" => "",
  "Books" => "",
  "Animation" => "",
  "Architecture" => "",
  "Photoshop"  => ""}

interests.each do |int, desc|
  Interest.create(title: int, description: desc)
end



  "http://www.archdaily.com/"

"http://www.dezeen.com/"
"http://www.notcot.org/"

sites = ["https://www.youtube.com/watch?v=I4r729ZMinQ",
"http://heytherefancypants.com/Photos/CreedmoreLakeNight2.png",
"http://heytherefancypants.com/Photos/FlatironsFromPlane_2.jpg",
"http://heytherefancypants.com/Photos/Grays%20Goat.jpg",
"http://heytherefancypants.com/Photos/Denver%20Day%20-%20Version%203.jpg",
"http://heytherefancypants.com/Photos/MexicoPinkHouse%20HDR.jpg",
"http://heytherefancypants.com/Photos/ShopHDR.jpg",
"http://heytherefancypants.com/Photos/PH_Submarine2.jpg",
"http://heytherefancypants.com/Photos/CampusLake3.jpg",
"http://heytherefancypants.com/Photos/FlatironsSnowAndKOBL.jpg",
"http://heytherefancypants.com/Photos/WindTurbines.jpg",
"http://heytherefancypants.com/Photos/FarrandField.jpg",
"http://heytherefancypants.com/Photos/Cactus.jpg",
"http://heytherefancypants.com/Photos/CampusLake1.jpg",
"http://heytherefancypants.com/Photos/KissingCouple.jpg",
"http://heytherefancypants.com/Photos/Luminarias%202.jpg",
"http://heytherefancypants.com/Photos/SwingAndFlatirons.jpg",
"http://heytherefancypants.com/Photos/Silos4.jpg",
"http://heytherefancypants.com/Photos/FlatironsSunSet1.jpg",
"http://heytherefancypants.com/Photos/Honolulu%20copy.jpg",
"http://heytherefancypants.com/Photos/kitesurfer.jpg",
"http://heytherefancypants.com/Photos/SnowTree.jpg",
"http://www.youtube.com/watch?v=mjJwa2MX4nY",
"http://www.youtube.com/watch?v=mjJwa2MX4nY",
"https://vimeo.com/27491062",
"https://vimeo.com/35204761",
"http://www.youtube.com/watch?v=t3VVx1E1r74",
"http://heytherefancypants.com/",
"https://vimeo.com/91496760",
"https://vimeo.com/70573323",
"https://vimeo.com/37870722",
"https://vimeo.com/36768371",
"https://vimeo.com/31455885",
"https://vimeo.com/32113233",
"https://vimeo.com/26119425",
"https://vimeo.com/17808185",
"https://vimeo.com/34814788",
"https://vimeo.com/28408829",
"https://vimeo.com/28454865",
"https://vimeo.com/22894261",
"https://vimeo.com/26694098",
"https://vimeo.com/48153500",
"https://vimeo.com/57634244",
"http://vimeo.com/user2667979/borddemer1",
"http://livingwood.org/",
"https://vimeo.com/95252357",
"http://www.musictonic.com",
"www.boreme.com/posting.php?id=9425&page=1/",
"http://www.io9.com/5893615/absolutely-mindblowing-video-shot-from-the-space-shuttle-during-launch/",
"www.gtspirit.com/wp-content/gallery/pagani-huayra-road-test-1/21.jpg/",
"http://www.youtube.com/watch?v=yn3FWb-vQQ4",
"http://aeon.co/magazine/living-together/james-somers-web-developer-money/",
"blog.assaflavie.com/touch/"]

20.times do |i|
  UserInterest.create(user_id: 1, interest_id: i )
  UserInterest.create(user_id: 2, interest_id: i )
end

sites.each_with_index do |site, idx|
  Website.create(url: site, title: "Sample Site #{idx}", submitter_id: 1)
  Interest.all.each do |interest|
    WebsiteInterest.create(website_id: idx, interest_id: interest.id )
  end
end