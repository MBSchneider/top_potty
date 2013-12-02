class AddDirectionsColumn < ActiveRecord::Migration
  def change
    add_column :restrooms, :directions, :string
  end
end
