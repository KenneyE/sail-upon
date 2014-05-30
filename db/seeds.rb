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
  "Airplanes" => "If you don't like airplanes, then I don't want to know you. Flat out.",

  "Animation" => "Like Rugrats and Hey Arnold!",

  "Architecture" => "Buildings go up. Buildings go down. Art.",

  "Art" => "All of the world's finest arts.",

  "Astronomy" => "No telescope? No problem. Explore astronomy, from the Big Bang to the mission to Mars.",

  "Beer" => "Do your friends hate going to breweries with you? Do you love IPAs because it seems to be what beer aficionados do? Or do you just love getting drunk?",

  "Bicycling" => "From fixies to mountain bikes to beach cruisers.",

  "Books" => "Love a good read? Then what the hell are you doing here?",

  "Camping" => "Like the idea of being homeless, but only for a couple days?",

  "Cars" => "Saving up for a Porsche? Either way, learn about cars, technologies, stunts and more here.",

  "Cigars" => "Put on your smoking jacket and explore cigars: the best international brands, accessories and more.",

  "Comics" => "Let's get our nerd on.",

  "Cooking" => "Cooking or cookery is the art of preparing food for consumption with the use of heat. Hey Wikipedia, that's pretty neat!",

  "Dogs" => "If you're a cat person then get the hell out. Dog people only beyond this point",

  "Extreme Sports" => "Have ice water running through your veins? Can't get it up unless your on the brink? Are you sick of these rhetorical questions?",

  "Fitness" => "Considering that you're here, I don't believe you.",

  "Games" => "We've got Dungeons and Dragons and music and drawing and literally everything.",

  "Generally Awesome" => "I don't know how to categorize this stuff. All I know is it's generally pretty awesome.",

  "Graphic Design" => "From logos to websites, graphic designers have perfected the art of visual communication. Check it out.",

  "Making Things" => "Just about people that are really good at making things. Whatever that may be.",

  "Movies" => "Always first in line for the best new movies? Explore the magic of Hollywood and the cinema.",

  "Music" => "Music makes the world go round. Discover new bands, songs, lyrics, music videos and more.",

  "Photography" => "See amazing photos and get photography tips and ideas, from Polaroids to digital cameras.",

  "Photoshop"  => "Bad at taking pictures but want to make people think you're good at it? Too cool for instagram? Perfect recipe for a Photoshop master.",

  "Science"  => "You ever watched Breaking Bad and think, 'I could do that!'?",

  "Skiing" => "Love sending it to the moon on a blower day? Love shuttin er down with one big McConkey turn? Love blue bird days with all time pow? Love hanging it out to dry off a dope kicker? Are your Pontoons not wide enough?",

  "Technology" => "Gizmos and gadgets.",

  "Travel" => "See all the world. From the comfort of your desk chair.",

  "Trains" => "Trains are way underrated. Those things are so awesome. Why don't more people talk about that?",

  "Video Games" => "So you love no-scoping newbs and crushing Code Red? Love it when a 13 year old calls you a punk bitch? Then come pwn some websites about it.",

  "Web Development" => "It's what makes the world go 'round."
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
"http://www.youtube.com/watch?v=mjJwa2MX4nY" => ["Airplanes", "Extreme Sports"] ,
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
"http://www.youtube.com/watch?v=yn3FWb-vQQ4" => [""] ,
"http://aeon.co/magazine/living-together/james-somers-web-developer-money/" => ["Science", "Making Things"] ,
"http://blog.assaflavie.com/touch/" => ["Science"],
"http://www.esquire.com/blogs/car-news/51-coolest-cars-of-the-last-50-years/" => ["Cars"],
"http://www.365tomorrows.com/11/15/the-djinn-effect/" => ["Science"],
"http://www.flightradar24.com/t_blank/" => ["Airplanes"],
"www.dtelepathy.com/blog/inspiration/beautiful-color-palettes-for-your-next-web-project/" => ["Graphic Design", "Art", "Photoshop"],
"http://www.imgur.com/a/rNPff?gallery/" => ["Movies", "Art", "Graphic Design"],
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
"www.thebuildingblox.com/lee-jae-hyos-amazing-wooden-tables/" => ["Making Things", "Generally Awesome"],
"http://iacopoapps.appspot.com/hopalongwebgl/" => ["Graphic Design", "Animation"],
"http://threesixfive.tv/phantom-1000-fps-ski-shoot/" => ["Skiing", "Movies", "Photography"],
"www.officiallyfun.com/entertainment/the-international-space-station-experiments-with-long-exposure-photography-12-photos/" => ["Photography", "Astronomy", "Science", "Technology"],
"http://hakim.se/experiments/html5/keylight/03/#331x369_450x316_612x502_540x669_3" => ["Technology", "Graphic Design", "Generally Awesome"],
"saganseries.com/" => ["Science", "Astronomy"],
"www.designboom.com/technology/interactive-water-light-graffiti-wall-installation-by-antonin-fourneau/" => ["Art", "Architecture"],
"slow.com/" => ["Technology"],
"blog.beeriety.com/2009/07/06/how-beer-is-made/" => ["Beer"],
"onebigphoto.com/milky-way-over-mount-fuji/" => ["Photography", "Travel"],
"http://www.barcinski-jeanjean.com/entries/endlessintrestingness/" => ["Generally Awesome"],
"dfcovideo.com/random/29er-bike-completely-parallel-to-the-ground/" => ["Extreme Sports"],
"www.totalfilm.com/features/20-upcoming-trailers-we-re-most-excited-about/" => ["Movies"],
"http://www.youtube.com/watch?v=ZwwS4YOTbbw" => ["Science", "Technology", "Generally Awesome"],
"green-landscape.com/town-with-so-perfect-views/" => ["Travel", "Photography"],
"http://www.youtube.com/watch?feature=player_embedded&v=wNViNqHmnzM" => ["Movies"],
"http://www.youtube.com/watch?feature=player_embedded&v=HHaJY6SL7GE" => ["Movies", "Art"],
"www.adventure-journal.com/2014/02/weekend-cabin-lake-joseph-boathouse-new-york/" => ["Architecture", "Travel"],
"www.pastemagazine.com/blogs/lists/2014/05/100-craft-beers-you-have-to-drink.html?a=1/" => ["Beer", "Cooking"],
"airows.com/40-incredibly-creative-logo-designs-2/" => ["Graphic Design", "Art"],
# "http://bookswithfriends.co/session/new" => ["Web Development", "Books"],
# "http://sketchmate.herokuapp.com/" => ["Web Development", "Games", "Art"],
# "http://air-dnd.herokuapp.com/" => ["Web Development", "Games"],
# "http://kiva-for-paralegals.herokuapp.com/session/new" => ["Web Development"],
# "http://swift-reader.com/" => ["Web Development", "Books"],
"http://www.whatsgroovy.com/" => ["Web Development", "Music", "Games"],
"http://kenneye.github.io/snake/" => ["Games", "Video Games", "Web Development"],
"http://kenneye.github.io/asteroids/" => ["Games", "Video Games", "Web Development"],
# "http://dindin.io/" => ["Cooking", "Web Development"]
"https://vimeo.com/69882318" => ["Movies", "Comics"],
"http://images.summitpost.org/original/877866.jpg" => ["Photography", "Generally Awesome"],
"unofficialnetworks.com/whos-ski-lift-world-41734/" => ["Skiing", "Travel"],
"http://cdn.sneakhype.com/wp-content/uploads/2014/05/lol-funny-animated-gifs-8.gif" => ["Animation", "Graphic Design"],
"www.funcage.com/blog/a-tribute-to-the-majestic-beauty-of-engines-30-photos/" => ["Science", "Technology", "Airplanes"],
"http://blog.brilliance.com/iconic-rings/" => ["Comics", "Web Development"],
"http://www.panoramas.dk/mars/mars-greeleyhaven2/" => ["Science", "Astronomy", "Technology"],
"http://upload.wikimedia.org/wikipedia/commons/5/55/Moraine_Lake.jpg" => ["Camping", "Photography"],
"http://8tracks.com/" => ["Music"],
"http://www.crazythemes.com/images/F-15-Military-Jet-Fighter.jpg" => ["Airplanes"],
"www.dailyinspiration.nl/10-awesome-infographics-for-graphic-designers/" => ["Graphic Design", "Art"],
"www.musicsmasher.net/" => ["Music"],
"http://blog.spoongraphics.co.uk/tutorials/create-realistic-money-effect-photoshop/" => ["Photoshop"],
"webexpedition18.com/articles/35-fresh-and-creative-photoshop-tutorials/" => ["Photoshop"],
"abduzeedo.com/double-exposure-style-photoshop/" => ["Photoshop"],
"http://editorial.designtaxi.com/news-bountifulbreweries140114/chart.png" => ["Beer"],
"www.ivillage.com/best-american-beers/3-b-472199?ivNPA=1&sky=stu|ivl|fd|americanbeers|/" => ["Beer"],
"http://haphappy.com/wp-content/uploads/2011/01/beer.jpg" => ["Beer"],
"www.yooko.fr/rangez-votre-velo-avec-style/" => ["Bicycling"],
"http://www.youtube.com/watch?v=7h2XZqZHoc4" => ["Bicycling"],
"https://www.youtube.com/watch?v=OrbSRLiIdOk" => ["Bicycling"],
"mocoloco.com/mr/lucetta-bike-lights/" => ["Bicycling"],
"https://www.youtube.com/watch?v=x76VEPXYaI0&list=TL-qTlWIk2VblWcAelS4yMz6oOcCg10sUo" => ["Bicycling"],
"blog.visual.ly/celebrate-independence-with-these-17-infographics-about-bicycling/" => ["Bicycling"],
"http://www.seriouswheels.com/pics-2012/a/2012-A-Kahn-Design-Ferrari-458-Italia-Static-1-1280x960.jpg" => ["Cars"],
"jalopnik.com/ten-driving-techniques-that-will-turn-you-into-a-master-837305612/all/" => ["Cars"],
"www.topgear.com/uk/car-news/peugeot-2008-dakar-car-revealed-red-bull-total-2014-04-15/" => ["Cars"],
"coolmaterial.com/roundup/classic-cars-that-define-cool/" => ["Cars"],
"ofironandoak.com/2013/05/cuban-cigars-a-forbidden-luxury/" => ["Cigars"],
"www.gentlemansgazette.com/cigar-guide-history-making-of-humidor/" => ["Cigars"],
"www.werd.com/18031/ti2-sentinel-titanium-cache/" => ["Cigars"],
"www.youtube.com/watch?v=ckqzMgWGzaY/" => ["Cigars"],
"oculoid.com/unique-styled-comic-book-heroes-by-chris-uminga/" => ["Comics"],
"www.avclub.com/articles/who-am-i-this-time-13-comic-book-characters-with-c,53707/" => ["Comics"],
"www.foodnetwork.com/recipes/articles/50-milkshakes.html/" => ["Cooking"],
"foodgawker.com/popular/favorites/" => ["Cooking"],
"kidcrave.com/scoop/webs-tastiest-pancakes-recipes/" => ["Cooking"],
"imgur.com/a/YBQFI/" => ["Fitness"],
"www.pcworld.com/article/2156580/google-maps-adds-elevation-data-for-cyclists-braving-the-hills.html/" => ["Fitness"],
"simplesciencefitness.com/" => ["Fitness"],
"neilarey.com/workouts.html?start=15/" => ["Fitness"],
"zentofitness.com/bodyweight/" => ["Fitness"],
"neilarey.com/workouts/code-of-abs-workout.html/" => ["Fitness"],
"imgur.com/r/skiing/1ujHRId/" => ["Skiing"],
"vimeo.com/20759569/" => ["Skiing"],
"www.matt-gibson.org/jackson-hole-powder-porn/" => ["Skiing"],
"https://www.youtube.com/watch?v=G5dOB3VSyC8&feature=kp" => ["Skiing"],
"vimeo.com/15317426/" => ["Skiing"],
"en.wikipedia.org/wiki/Steam_locomotive_components/" => ["Trains"],
"www.oobject.com/category/20-railroad-snowplows/" => ["Trains"],
"www.youtube.com/watch?v=MlA2INOpT78/" => ["Trains"],
"www.railpictures.net/viewphoto.php?id=264331/" => ["Trains"]
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