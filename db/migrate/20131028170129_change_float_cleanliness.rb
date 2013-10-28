class ChangeFloatCleanliness < ActiveRecord::Migration
  def up
    change_column :restrooms, :cleanliness, :float
  end

  def down
    change_column :restrooms, :cleanliness, :integer
  end
end
