class CleanlinessRating < ActiveRecord::Base
  attr_accessible :cleanlinessrating
  attr_protected :restroom_id

  belongs_to :restroom

  after_create :update_cleanliness_average

  def update_cleanliness_average
    restroom.update_cleanaverage
  end
end
