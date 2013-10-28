class CleanlinessRating < ActiveRecord::Base
  attr_accessible :cleanlinessrating, :restroom_id
  belongs_to :restroom
end
