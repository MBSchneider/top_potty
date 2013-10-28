class CreateCleanlinessRatings < ActiveRecord::Migration
  def change
    create_table :cleanliness_ratings do |t|
      t.integer :restroom_id
      t.float :cleanlinessrating

      t.timestamps
    end
  end
end
