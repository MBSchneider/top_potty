class AddCommentsToRestroom < ActiveRecord::Migration
  def change
    add_column :restrooms, :comment, :string
  end
end
