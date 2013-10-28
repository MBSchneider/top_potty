class Restroom < ActiveRecord::Base
  attr_accessible :cleanliness, :location, :malefemale
  validates :location, :malefemale, :cleanliness, :presence => true
end
