class AddLocationToBrewery < ActiveRecord::Migration
  def change
  	add_column :breweries, :location, :string
  end
end
