class AddNotesTable < ActiveRecord::Migration
  create_table :notes do |t|
    t.text :note
  end
end
