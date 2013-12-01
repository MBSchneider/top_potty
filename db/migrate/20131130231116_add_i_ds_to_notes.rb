class AddIDsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :restroom_id, :integer
    add_column :notes, :user_id, :integer
  end
end
