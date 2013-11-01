class Restroom < ActiveRecord::Base
  attr_accessible :cleanliness, :location, :comment, :malefemale, :foundwithin, :cleanliness_ratings_attributes, :latitude, :longitude
  validates :location, :malefemale, :presence => true
  has_many :cleanliness_ratings, dependent: :destroy
  accepts_nested_attributes_for :cleanliness_ratings
  geocoded_by :location
  after_validation :geocode

  def self.search(query)
    where("location LIKE ?, %#{query}%")
  end
end
