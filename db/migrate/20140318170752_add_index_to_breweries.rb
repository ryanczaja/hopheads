class AddIndexToBreweries < ActiveRecord::Migration
  def change
  	add_index :beers, :brewery_id
  end
end
