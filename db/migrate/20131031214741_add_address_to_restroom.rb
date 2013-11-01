class AddAddressToRestroom < ActiveRecord::Migration
  def change
    add_column :restrooms, :address, :string
  end
end
