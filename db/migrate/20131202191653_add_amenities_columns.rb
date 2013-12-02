class AddAmenitiesColumns < ActiveRecord::Migration
  def change
    add_column :restrooms, :diaper, :boolean, :default => false
    add_column :restrooms, :attendant, :boolean, :default => false
    add_column :restrooms, :handsfreetoilets, :boolean, :default => false
    add_column :restrooms, :handsfreefaucets, :boolean, :default => false
    add_column :restrooms, :handsfreeurinals, :boolean, :default => false
    add_column :restrooms, :urinalprivacy, :boolean, :default => false
    add_column :restrooms, :stalldoors, :boolean, :default => true
    add_column :restrooms, :heatedseats, :boolean, :default => false
    add_column :restrooms, :numberofstalls, :integer, :default => 1
    add_column :restrooms, :numberofurinals, :integer, :default => 1
    add_column :restrooms, :wheelchair, :boolean, :default => true
    add_column :restrooms, :outlets, :boolean, :default => false
    add_column :restrooms, :makeupmirror, :boolean, :default => false
    add_column :restrooms, :fhdispenser, :boolean, :default => false
  end
end
