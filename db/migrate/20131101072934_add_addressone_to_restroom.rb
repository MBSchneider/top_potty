class AddAddressoneToRestroom < ActiveRecord::Migration
  def change
    add_column :restrooms, :addressone, :string
  end
end
