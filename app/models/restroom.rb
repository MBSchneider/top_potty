class Restroom < ActiveRecord::Base

  attr_accessible :cleanliness, :location, :malefemale, :foundwithin,
                  :cleanliness_ratings_attributes, :latitude, :longitude,
                  :diaper, :attendant, :handsfreetoilets, :handsfreefaucets,
                  :handsfreeurinals, :urinalprivacy, :stalldoors,
                  :heatedseats, :numberofstalls, :numberofurinals,
                  :wheelchair, :outlets, :makeupmirror, :fhdispenser,
                  :notes_attributes, :directions, :note

  validates :location, :malefemale, :addressone, :addresstwo, :foundwithin, :presence => true

  has_many :cleanliness_ratings, dependent: :destroy
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :cleanliness_ratings, :notes
  geocoded_by :location
  after_validation :geocode

  def self.search(query)
    where("location LIKE ?, %#{query}%")
  end

  def imageboolean
    attribute ? 'Yes' : 'No'
  end
end
