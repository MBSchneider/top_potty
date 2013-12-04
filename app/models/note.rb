class Note < ActiveRecord::Base
  attr_accessible :comment, :restroom_id, :user_id
  belongs_to :restroom
  belongs_to :user
end
