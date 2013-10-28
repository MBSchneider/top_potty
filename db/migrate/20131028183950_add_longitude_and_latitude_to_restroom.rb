class AddLongitudeAndLatitudeToRestroom < ActiveRecord::Migration
  def change
      add_column :restrooms, :longitude, :float
      add_column :restrooms, :latitude, :float
  end
end
