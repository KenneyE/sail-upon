# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



20.times do |i|
  Interest.create(name: "Interest#{i}", description: "An interest")
  User.create(username: "User#{i}",
              password: "foobar")
end

10.times do |i|
  UserInterest.create(user_id: 1, interest_id: i )
  UserInterest.create(user_id: 2, interest_id: i+5)
  UserInterest.create(user_id: 3, interest_id: i+5)
end
