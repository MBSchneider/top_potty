class AddAddresstwoToRestroom < ActiveRecord::Migration
  def change
    add_column :restrooms, :addresstwo, :string
  end
end
