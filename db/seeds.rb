# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
restroom_list = [
  [ "511 Boren Ave N, Seattle WA", "CodeFellows basement", "male"],
  [ "511 Boren Ave N, Seattle WA", "CodeFellows 2nd floor", "male"],
  [ "511 Boren Ave N, Seattle WA", "CodeFellows basement", "female"],
  [ "511 Boren Ave N, Seattle WA", "CodeFellows 2nd floor", "female"],
  [ "2210 Westlake Ave, Seattle WA", "Whole Foods", "male"],
  [ "520 Terry Ave N, Seattle WA", "Specialty's Cafe", "male"],
  [ "530 Westlake Ave N, Seattle WA", "Guitar Center", "female"],
  [ "2623 NE University Village St, Seattle WA", "near Bartell's", "female"],
  [ "308 Kirkland Ave, Kirkland WA", "Kirkland Library", "male"],
  [ "7520 35th ave NE #3, Seattle WA", "Thai of Wedgwood", "male"],
  [ "2800 Southcenter Mall, Seattle, WA", "Southcenter Mall", "male"],
  [ "2800 Southcenter Mall, Seattle, WA", "Southcenter Mall", "male"],
  [ "401 NE Northgate Way, Seattle, WA", "Northgate Mall", "male"],
  [ "401 NE Northgate Way, Seattle, WA", "Northgate Mall", "female"],
  [ "2623 NE University Village St #7, Seattle, WA", "University Village", "male"],
  [ "2623 NE University Village St #7, Seattle, WA", "University Village", "male"],
  [ "600 Pine St, Seattle, WA", "Pacific Place", "male"],
  [ "600 Pine St, Seattle, WA", "Pacific Place", "female"],
  [ "400 Pine St, Seattle, WA", "Westlake Mall", "male"],
  [ "400 Pine St, Seattle, WA", "Westlake Mall", "female"]
]

cleanlinessrating_list = [9, 9, 8, 8, 7, 8, 3, 9, 8, 7, 6, 7, 7, 7, 9, 9, 9, 8, 5, 6]

x = 0
restroom_list.each do |location, foundwithin, malefemale|
  r = Restroom.new( location: location, foundwithin: foundwithin, malefemale: malefemale )
  @this_address = Geocoder.search(r.location)[0].formatted_address.split(",")
  r.addressone = @this_address[0]
  r.addresstwo = @this_address[1] + @this_address[2]
  r.cleanaverage = cleanlinessrating_list[x]
  r.save
  Restroom.last.cleanliness_ratings.build
  a = Restroom.last.cleanliness_ratings.new( cleanlinessrating: cleanlinessrating_list[x] )
  x += 1
  a.save
  sleep(2)
end



# cleanlinessrating_list.each do |restroom_id, cleanlinessrating|
#   these_restrooms[restroom_id.to_i].cleanliness_ratings.build
#   a = restroom_list[restroom_id.to_i].cleanliness_ratings.new( cleanlinessrating: cleanlinessrating )
#   a.restroom = restroom_list[restroom_id.to_i]
#   a.save
# end
