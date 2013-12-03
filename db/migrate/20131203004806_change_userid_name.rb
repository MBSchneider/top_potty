class ChangeUseridName < ActiveRecord::Migration
  def change
    add_column :restrooms, :user_id, :integer
  end
end
