class ChangeNotesToComments < ActiveRecord::Migration
  def change
    rename_column :notes, :note, :comment
    rename_column :notes, :user_id, :uid
  end
end
