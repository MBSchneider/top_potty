class RemoveCommentFromRestroom < ActiveRecord::Migration
  def up
    remove_column :restrooms, :comment
  end

  def down
  end
end
