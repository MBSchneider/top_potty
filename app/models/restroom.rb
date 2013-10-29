class Restroom < ActiveRecord::Base
  attr_accessible :cleanliness, :location, :malefemale, :cleanliness_ratings_attributes
  validates :location, :malefemale, :presence => true
  has_many :cleanliness_ratings, dependent: :destroy
  accepts_nested_attributes_for :cleanliness_ratings

  def self.search(query)
    where("location like ?", "%#{query}%")
  end
end
