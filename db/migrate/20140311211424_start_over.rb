class StartOver < ActiveRecord::Migration
  def up
  	remove_column :breweries, :location
  	remove_column :posts, :brewery
  	remove_index :beers, :brewery_id

  	add_column :breweries, :location_id, :integer
  	add_index :breweries, :location_id

  	add_column :posts, :brewery_id, :integer
  	add_index :posts, :brewery_id
  end

  def down
  end
end
