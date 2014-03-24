class AddBreweriesToLocations < ActiveRecord::Migration
  def change
  	add_column :locations, :brewery_id, :integer
  	add_index :locations, :brewery_id
  end
end
