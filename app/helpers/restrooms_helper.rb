module RestroomsHelper
  def imageboolean boolean
    image_tag("#{boolean}.png", :size => "20x20", :alt => boolean)
  end

end
