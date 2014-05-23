# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(username: "Guest User", password: "password")
User.create(username: "Eric", password: "foobar")


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
  Interest.create(name: "Interest#{i}", description: "An interest")
  UserInterest.create(user_id: 1, interest_id: i )
  UserInterest.create(user_id: 2, interest_id: i )
end

sites.each_with_index do |site, idx|
  Website.create(url: site, title: "Sample Site #{idx}", submitter_id: 1)
  Interest.all.each do |interest|
    WebsiteInterest.create(website_id: idx, interest_id: interest.id )
  end
end