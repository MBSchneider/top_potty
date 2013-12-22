class AddCleanAverageToRestrooms < ActiveRecord::Migration
  def change
    add_column :restrooms, :cleanaverage, :float
  end
end
