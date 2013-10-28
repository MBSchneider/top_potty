class Restroom < ActiveRecord::Base
  attr_accessible :cleanliness, :location, :malefemale
end
