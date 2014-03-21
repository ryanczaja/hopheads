class AddBeersToBreweries < ActiveRecord::Migration
  def change
  	add_column :breweries, :beer_id, :integer
  	add_index :breweries, :beer_id
  end
end
