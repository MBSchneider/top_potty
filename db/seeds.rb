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
  [ "7520 35th ave NE #3, Seattle WA", "Thai of Wedgwood", "male"]
]

restroom_list.each do |location, foundwithin, malefemale|
  Restroom.create( location: location, foundwithin: foundwithin, malefemale: malefemale )
end

cleanlinessrating_list = [
  [ "1", "8"],
  [ "1", "9"],
  [ "1", "8"],
  [ "1", "10"],
  [ "2", "8"],
  [ "2", "9"],
  [ "3", "7"],
  [ "3", "9"],
  [ "4", "7"],
  [ "4", "9"],
  [ "5", "7"],
  [ "6", "8"],
  [ "7", "4"],
  [ "7", "3"],
  [ "8", "9"],
  [ "9", "8"],
  [ "10", "7"]
]

cleanlinessrating_list.each do |restroom_id, cleanlinessrating|
  CleanlinessRating.create( restroom_id: restroom_id, cleanlinessrating: cleanlinessrating )
end
