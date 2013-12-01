class ChangeNoteUser < ActiveRecord::Migration
  def change
    rename_column :notes, :uid, :user_id
  end
end
