class Note < ActiveRecord::Base
  attr_accessible :comment, :user_id
  attr_protected :restroom_id
  belongs_to :restroom
  belongs_to :user
end
