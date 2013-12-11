class CleanlinessRating < ActiveRecord::Base
  attr_accessible :cleanlinessrating
  attr_protected :restroom_id
  belongs_to :restroom
end
