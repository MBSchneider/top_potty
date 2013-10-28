class Restroom < ActiveRecord::Base
  attr_accessible :cleanliness, :location, :malefemale
  validates :location, :presence => true
  validates :malefemale, :presence => true
  validates :cleanliness, :presence => true
end
