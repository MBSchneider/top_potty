class CreateRestrooms < ActiveRecord::Migration
  def change
    create_table :restrooms do |t|
      t.string :location
      t.string :malefemale
      t.integer :cleanliness

      t.timestamps
    end
  end
end
