class Restroom < ActiveRecord::Base

  attr_accessible :cleanliness, :location, :malefemale, :foundwithin,
                  :cleanliness_ratings_attributes, :latitude, :longitude,
                  :diaper, :attendant, :handsfreetoilets, :handsfreefaucets,
                  :handsfreeurinals, :urinalprivacy, :stalldoors,
                  :heatedseats, :numberofstalls, :numberofurinals,
                  :wheelchair, :outlets, :makeupmirror, :fhdispenser,
                  :notes_attributes, :directions, :note, :user_id, :cleanaverage

  validates :location, :malefemale, :addressone, :foundwithin, :presence => true
  validate :location_must_be_specific

  has_many :cleanliness_ratings, dependent: :destroy
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :cleanliness_ratings, :notes
  geocoded_by :location
  after_validation :geocode

  def update_cleanaverage
    @value = 0
    self.cleanliness_ratings.each do |rating|
      @value = @value + rating.cleanlinessrating
    end
    @total = self.cleanliness_ratings.size

    update_attributes(cleanaverage: @value.to_f / @total.to_f)
  end

  def location_must_be_specific

    if Geocoder.search(location)[0].data["geometry"]["location_type"] == "GEOMETRIC_CENTER"
      errors.add(:location, "must be more specific.")
    end
  end
end
