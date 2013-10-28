class Restroom < ActiveRecord::Base
  attr_accessible :cleanliness, :location, :malefemale, :latitude, :longitude
  geocoded_by :location
  after_validation :geocode


end
