class AddFoundwithinToRestroom < ActiveRecord::Migration
  def change
    add_column :restrooms, :foundwithin, :string
  end
end
