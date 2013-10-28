class RemoveCleanlinessFromRestrooms < ActiveRecord::Migration
  def up
    remove_column :restrooms, :cleanliness
  end

  def down
  end
end
